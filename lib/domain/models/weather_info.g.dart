// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirQualityImpl _$$AirQualityImplFromJson(Map<String, dynamic> json) =>
    _$AirQualityImpl(
      aqi: (json['aqi'] as num?)?.toInt(),
      pm25: (json['pm25'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AirQualityImplToJson(_$AirQualityImpl instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'pm25': instance.pm25,
      'pm10': instance.pm10,
    };

_$DailyWeatherImpl _$$DailyWeatherImplFromJson(Map<String, dynamic> json) =>
    _$DailyWeatherImpl(
      date: DateTime.parse(json['date'] as String),
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$DailyWeatherImplToJson(_$DailyWeatherImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'summary': instance.summary,
    };

_$WeatherInfoImpl _$$WeatherInfoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherInfoImpl(
      city: json['city'] as String,
      currentTemp: (json['currentTemp'] as num).toDouble(),
      currentSummary: json['currentSummary'] as String,
      next7Days: (json['next7Days'] as List<dynamic>)
          .map((e) => DailyWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      airQuality: AirQuality.fromJson(
        json['airQuality'] as Map<String, dynamic>,
      ),
      source: json['source'] as String,
    );

Map<String, dynamic> _$$WeatherInfoImplToJson(_$WeatherInfoImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'currentTemp': instance.currentTemp,
      'currentSummary': instance.currentSummary,
      'next7Days': instance.next7Days,
      'airQuality': instance.airQuality,
      'source': instance.source,
    };
