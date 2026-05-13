import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_session.freezed.dart';
part 'pomodoro_session.g.dart';

enum PomodoroMode { focus, shortBreak, longBreak }

@freezed
class PomodoroSession with _$PomodoroSession {
  const factory PomodoroSession({
    int? id,
    required int plannedSeconds,
    required int elapsedSeconds,
    required bool completed,
    required DateTime startedAt,
    DateTime? endedAt,
    int? todoId,
    required PomodoroMode mode,
  }) = _PomodoroSession;

  factory PomodoroSession.fromJson(Map<String, dynamic> json) =>
      _$PomodoroSessionFromJson(json);
}

