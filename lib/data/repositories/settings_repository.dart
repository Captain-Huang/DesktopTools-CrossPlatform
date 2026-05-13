import 'package:desktop_tools_flutter/domain/models/app_settings.dart';
import 'package:sqflite/sqflite.dart';

class SettingsRepository {
  SettingsRepository(this._db);

  final Database _db;

  Future<AppSettings> getSettings() async {
    final row = (await _db.query('settings', where: 'id = 1')).first;
    return AppSettings(
      focusMinutes: row['focus_minutes'] as int,
      shortBreakMinutes: row['short_break_minutes'] as int,
      longBreakMinutes: row['long_break_minutes'] as int,
      longBreakEvery: row['long_break_every'] as int,
      todoReminderMinutes: row['todo_reminder_minutes'] as int,
      weatherCity: row['weather_city'] as String,
    );
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _db.update('settings', {
      'focus_minutes': settings.focusMinutes,
      'short_break_minutes': settings.shortBreakMinutes,
      'long_break_minutes': settings.longBreakMinutes,
      'long_break_every': settings.longBreakEvery,
      'todo_reminder_minutes': settings.todoReminderMinutes,
      'weather_city': settings.weatherCity,
    }, where: 'id = 1');
  }
}

