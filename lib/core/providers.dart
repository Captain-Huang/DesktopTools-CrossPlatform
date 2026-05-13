import 'package:desktop_tools_flutter/core/network/dio_provider.dart';
import 'package:desktop_tools_flutter/core/notifications/local_notification_service.dart';
import 'package:desktop_tools_flutter/core/platform/window_behavior.dart';
import 'package:desktop_tools_flutter/data/repositories/calendar_repository.dart';
import 'package:desktop_tools_flutter/data/repositories/ip_repository.dart';
import 'package:desktop_tools_flutter/data/repositories/pomodoro_repository.dart';
import 'package:desktop_tools_flutter/data/repositories/settings_repository.dart';
import 'package:desktop_tools_flutter/data/repositories/todo_repository.dart';
import 'package:desktop_tools_flutter/data/repositories/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final databaseProvider = Provider<Database>(
  (_) => throw UnimplementedError('Database must be overridden in main().'),
);

final notificationServiceProvider = Provider<LocalNotificationService>(
  (_) =>
      throw UnimplementedError('LocalNotificationService must be overridden.'),
);

final windowBehaviorProvider = Provider<WindowBehavior>(
  (_) => WindowBehaviorImpl(),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(ref.watch(databaseProvider)),
);

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepository(ref.watch(databaseProvider)),
);

final pomodoroRepositoryProvider = Provider<PomodoroRepository>(
  (ref) => PomodoroRepository(ref.watch(databaseProvider)),
);

final ipRepositoryProvider = Provider<IpRepository>(
  (ref) => IpRepository(ref.watch(dioProvider)),
);

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepository(ref.watch(dioProvider)),
);

final calendarRepositoryProvider = Provider<CalendarRepository>(
  (_) => CalendarRepository(),
);

