import 'package:desktop_tools_flutter/domain/models/pomodoro_session.dart';
import 'package:sqflite/sqflite.dart';

class PomodoroStats {
  PomodoroStats({
    required this.todayCompletedPomodoros,
    required this.todayFocusMinutes,
    required this.weekFocusMinutes,
  });

  final int todayCompletedPomodoros;
  final int todayFocusMinutes;
  final int weekFocusMinutes;
}

class PomodoroRepository {
  PomodoroRepository(this._db);

  final Database _db;

  Future<void> insertSession(PomodoroSession session) async {
    await _db.insert('pomodoro_sessions', {
      'planned_seconds': session.plannedSeconds,
      'elapsed_seconds': session.elapsedSeconds,
      'completed': session.completed ? 1 : 0,
      'started_at': session.startedAt.millisecondsSinceEpoch,
      'ended_at': session.endedAt?.millisecondsSinceEpoch,
      'todo_id': session.todoId,
      'mode': session.mode.name,
    });
  }

  Future<PomodoroStats> getStats(DateTime now) async {
    final dayStart = DateTime(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));
    final weekStart = dayStart.subtract(Duration(days: now.weekday - 1));

    final todayCompleted = Sqflite.firstIntValue(
          await _db.rawQuery(
            '''
      SELECT COUNT(*) FROM pomodoro_sessions
      WHERE mode = 'focus' AND completed = 1 AND started_at >= ? AND started_at < ?
      ''',
            [dayStart.millisecondsSinceEpoch, dayEnd.millisecondsSinceEpoch],
          ),
        ) ??
        0;

    final todayFocusSeconds = Sqflite.firstIntValue(
          await _db.rawQuery(
            '''
      SELECT COALESCE(SUM(elapsed_seconds), 0) FROM pomodoro_sessions
      WHERE mode = 'focus' AND started_at >= ? AND started_at < ?
      ''',
            [dayStart.millisecondsSinceEpoch, dayEnd.millisecondsSinceEpoch],
          ),
        ) ??
        0;

    final weekFocusSeconds = Sqflite.firstIntValue(
          await _db.rawQuery(
            '''
      SELECT COALESCE(SUM(elapsed_seconds), 0) FROM pomodoro_sessions
      WHERE mode = 'focus' AND started_at >= ? AND started_at < ?
      ''',
            [weekStart.millisecondsSinceEpoch, dayEnd.millisecondsSinceEpoch],
          ),
        ) ??
        0;

    return PomodoroStats(
      todayCompletedPomodoros: todayCompleted,
      todayFocusMinutes: (todayFocusSeconds / 60).floor(),
      weekFocusMinutes: (weekFocusSeconds / 60).floor(),
    );
  }
}

