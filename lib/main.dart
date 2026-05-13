import 'package:desktop_tools_flutter/app.dart';
import 'package:desktop_tools_flutter/core/notifications/local_notification_service.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/data/local/app_database.dart';
import 'package:desktop_tools_flutter/data/local/sqlite_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLiteFactory.ensureInitialized();
  final database = await AppDatabase.open();
  final notifications = LocalNotificationService();
  await notifications.init();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        notificationServiceProvider.overrideWithValue(notifications),
      ],
      child: const DesktopToolsApp(),
    ),
  );
}
