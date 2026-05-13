import 'package:desktop_tools_flutter/core/error/app_error.dart';
import 'package:desktop_tools_flutter/domain/models/weather_info.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  WeatherRepository(this._dio);

  final Dio _dio;

  Future<WeatherInfo> fetchByCity(String city) async {
    try {
      return await _fetchPrimary(city);
    } catch (_) {
      return _fetchBackup(city);
    }
  }

  Future<WeatherInfo> _fetchPrimary(String city) async {
    final geocoding = await _dio.get<Map<String, dynamic>>(
      'https://geocoding-api.open-meteo.com/v1/search',
      queryParameters: {'name': city, 'count': 1, 'language': 'zh'},
    );
    final result = (geocoding.data?['results'] as List<dynamic>?)?.firstOrNull;
    if (result == null) {
      throw const AppError(type: AppErrorType.network, message: '未找到城市');
    }
    final lat = (result['latitude'] as num).toDouble();
    final lon = (result['longitude'] as num).toDouble();
    final cityName = '${result['name']}';

    final weather = await _dio.get<Map<String, dynamic>>(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: {
        'latitude': lat,
        'longitude': lon,
        'current': 'temperature_2m,weather_code',
        'daily': 'temperature_2m_max,temperature_2m_min,weather_code',
        'timezone': 'auto',
      },
    );

    final air = await _dio.get<Map<String, dynamic>>(
      'https://air-quality-api.open-meteo.com/v1/air-quality',
      queryParameters: {
        'latitude': lat,
        'longitude': lon,
        'hourly': 'pm10,pm2_5,us_aqi',
        'timezone': 'auto',
      },
    );

    final current = weather.data?['current'] as Map<String, dynamic>?;
    final daily = weather.data?['daily'] as Map<String, dynamic>?;
    final dates = (daily?['time'] as List<dynamic>? ?? [])
        .map((e) => DateTime.parse('$e'))
        .take(7)
        .toList();
    final mins = (daily?['temperature_2m_min'] as List<dynamic>? ?? [])
        .map((e) => (e as num).toDouble())
        .take(7)
        .toList();
    final maxs = (daily?['temperature_2m_max'] as List<dynamic>? ?? [])
        .map((e) => (e as num).toDouble())
        .take(7)
        .toList();
    final codes = (daily?['weather_code'] as List<dynamic>? ?? [])
        .map((e) => e as int)
        .take(7)
        .toList();

    final items = <DailyWeather>[];
    for (var i = 0; i < dates.length; i++) {
      items.add(
        DailyWeather(
          date: dates[i],
          minTemp: mins[i],
          maxTemp: maxs[i],
          summary: _weatherCodeToText(codes[i]),
        ),
      );
    }

    final airHourly = air.data?['hourly'] as Map<String, dynamic>?;
    return WeatherInfo(
      city: cityName,
      currentTemp: ((current?['temperature_2m'] as num?) ?? 0).toDouble(),
      currentSummary: _weatherCodeToText((current?['weather_code'] as int?) ?? 0),
      next7Days: items,
      airQuality: AirQuality(
        aqi: (airHourly?['us_aqi'] as List<dynamic>?)?.firstOrNull as int?,
        pm25: ((airHourly?['pm2_5'] as List<dynamic>?)?.firstOrNull as num?)
            ?.toDouble(),
        pm10: ((airHourly?['pm10'] as List<dynamic>?)?.firstOrNull as num?)
            ?.toDouble(),
      ),
      source: 'open-meteo',
    );
  }

  Future<WeatherInfo> _fetchBackup(String city) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://wttr.in/$city',
      queryParameters: {'format': 'j1'},
    );
    final data = response.data;
    if (data == null) {
      throw const AppError(type: AppErrorType.network, message: '天气查询失败');
    }
    final current =
        (data['current_condition'] as List<dynamic>? ?? []).firstOrNull
            as Map<String, dynamic>?;
    final dailyRaw = (data['weather'] as List<dynamic>? ?? []).take(7).toList();
    final daily = dailyRaw.map((e) {
      final row = e as Map<String, dynamic>;
      return DailyWeather(
        date: DateTime.parse('${row['date']}'),
        minTemp: double.tryParse('${row['mintempC']}') ?? 0,
        maxTemp: double.tryParse('${row['maxtempC']}') ?? 0,
        summary:
            '${(row['hourly'] as List<dynamic>).first['weatherDesc'][0]['value']}',
      );
    }).toList();

    return WeatherInfo(
      city: city,
      currentTemp: double.tryParse('${current?['temp_C']}') ?? 0,
      currentSummary: '${current?['weatherDesc']?[0]?['value'] ?? '未知'}',
      next7Days: daily,
      airQuality: const AirQuality(),
      source: 'wttr.in',
    );
  }

  String _weatherCodeToText(int code) {
    if (code == 0) return '晴';
    if (code <= 3) return '多云';
    if (code <= 48) return '雾';
    if (code <= 67) return '雨';
    if (code <= 77) return '雪';
    return '阵雨';
  }
}

extension _FirstOrNull on List<dynamic> {
  dynamic get firstOrNull => isEmpty ? null : first;
}

