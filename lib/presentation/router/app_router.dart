import 'package:desktop_tools_flutter/presentation/shell/home_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((_) {
  return GoRouter(
    initialLocation: '/ip',
    routes: [
      GoRoute(
        path: '/:module',
        builder: (context, state) => HomeShell(module: state.pathParameters['module'] ?? 'ip'),
      ),
      GoRoute(path: '/', redirect: (_, __) => '/ip'),
    ],
  );
});

