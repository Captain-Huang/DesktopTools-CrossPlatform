import 'dart:async';

import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoReminderServiceProvider = Provider<TodoReminderService>(
  (ref) => TodoReminderService(ref),
);

class TodoReminderService {
  TodoReminderService(this._ref);

  final Ref _ref;
  final Set<int> _remindedTodoIds = <int>{};
  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => _check());
    _check();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _check() async {
    final todoRepo = _ref.read(todoRepositoryProvider);
    final settings = await _ref.read(settingsRepositoryProvider).getSettings();
    final todos = await todoRepo.getPending();
    final now = DateTime.now();
    for (final todo in todos) {
      final id = todo.id;
      final dueAt = todo.dueAt;
      if (id == null || dueAt == null) continue;
      if (_remindedTodoIds.contains(id)) continue;

      final remindAt = dueAt.subtract(Duration(minutes: settings.todoReminderMinutes));
      if (now.isAfter(remindAt) || now.isAtSameMomentAs(remindAt)) {
        await _ref.read(notificationServiceProvider).show(
          id: id,
          title: '待办即将到期',
          body: '${todo.title} 将在 ${settings.todoReminderMinutes} 分钟内到期',
        );
        _remindedTodoIds.add(id);
      }
    }
  }
}

