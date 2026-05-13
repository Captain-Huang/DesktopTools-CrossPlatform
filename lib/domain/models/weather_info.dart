import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';
part 'weather_info.g.dart';

@freezed
class AirQuality with _$AirQuality {
  const factory AirQuality({
    int? aqi,
    double? pm25,
    double? pm10,
  }) = _AirQuality;

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);
}

@freezed
class DailyWeather with _$DailyWeather {
  const factory DailyWeather({
    required DateTime date,
    required double minTemp,
    required double maxTemp,
    required String summary,
  }) = _DailyWeather;

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);
}

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required String city,
    required double currentTemp,
    required String currentSummary,
    required List<DailyWeather> next7Days,
    required AirQuality airQuality,
    required String source,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}

