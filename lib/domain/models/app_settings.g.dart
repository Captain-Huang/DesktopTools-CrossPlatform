// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      focusMinutes: (json['focusMinutes'] as num).toInt(),
      shortBreakMinutes: (json['shortBreakMinutes'] as num).toInt(),
      longBreakMinutes: (json['longBreakMinutes'] as num).toInt(),
      longBreakEvery: (json['longBreakEvery'] as num).toInt(),
      todoReminderMinutes: (json['todoReminderMinutes'] as num).toInt(),
      weatherCity: json['weatherCity'] as String,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'focusMinutes': instance.focusMinutes,
      'shortBreakMinutes': instance.shortBreakMinutes,
      'longBreakMinutes': instance.longBreakMinutes,
      'longBreakEvery': instance.longBreakEvery,
      'todoReminderMinutes': instance.todoReminderMinutes,
      'weatherCity': instance.weatherCity,
    };
