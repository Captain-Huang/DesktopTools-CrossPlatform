import 'package:desktop_tools_flutter/application/pomodoro/pomodoro_controller.dart';
import 'package:desktop_tools_flutter/domain/models/pomodoro_session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every N focus sessions should switch to long break', () {
    final mode = PomodoroController.nextBreakMode(
      completedFocusToday: 4,
      longBreakEvery: 4,
    );
    expect(mode, PomodoroMode.longBreak);
  });

  test('non-threshold focus session should switch to short break', () {
    final mode = PomodoroController.nextBreakMode(
      completedFocusToday: 3,
      longBreakEvery: 4,
    );
    expect(mode, PomodoroMode.shortBreak);
  });
}

