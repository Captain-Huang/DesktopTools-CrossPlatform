import 'package:desktop_tools_flutter/domain/models/pomodoro_session.dart';

class PomodoroRuntimeSnapshot {
  const PomodoroRuntimeSnapshot({
    required this.mode,
    required this.statusName,
    required this.plannedSeconds,
    required this.elapsedSeconds,
    required this.bindTodoId,
    required this.currentSessionStartAt,
    required this.savedAt,
  });

  final PomodoroMode mode;
  final String statusName;
  final int plannedSeconds;
  final int elapsedSeconds;
  final int? bindTodoId;
  final DateTime? currentSessionStartAt;
  final DateTime savedAt;
}

class PomodoroRuntimeStore {
  PomodoroRuntimeStore._();

  static PomodoroRuntimeSnapshot? snapshot;
}

