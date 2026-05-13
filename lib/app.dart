import 'package:desktop_tools_flutter/application/reminder/todo_reminder_service.dart';
import 'package:desktop_tools_flutter/core/theme/app_theme.dart';
import 'package:desktop_tools_flutter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesktopToolsApp extends ConsumerStatefulWidget {
  const DesktopToolsApp({super.key});

  @override
  ConsumerState<DesktopToolsApp> createState() => _DesktopToolsAppState();
}

class _DesktopToolsAppState extends ConsumerState<DesktopToolsApp> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(
      () => ref.read(todoReminderServiceProvider).start(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Desktop Tools',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}

