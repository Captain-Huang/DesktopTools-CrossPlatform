import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required int focusMinutes,
    required int shortBreakMinutes,
    required int longBreakMinutes,
    required int longBreakEvery,
    required int todoReminderMinutes,
    required String weatherCity,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}

