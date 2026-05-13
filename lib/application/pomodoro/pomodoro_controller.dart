import 'dart:async';

import 'package:desktop_tools_flutter/application/pomodoro/pomodoro_runtime_store.dart';
import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/data/repositories/pomodoro_repository.dart';
import 'package:desktop_tools_flutter/domain/models/pomodoro_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PomodoroStatus { idle, running, paused }

class PomodoroState {
  PomodoroState({
    required this.mode,
    required this.status,
    required this.plannedSeconds,
    required this.elapsedSeconds,
    required this.stats,
    this.bindTodoId,
    this.currentSessionStartAt,
    this.error,
  });

  final PomodoroMode mode;
  final PomodoroStatus status;
  final int plannedSeconds;
  final int elapsedSeconds;
  final int? bindTodoId;
  final DateTime? currentSessionStartAt;
  final PomodoroStats stats;
  final String? error;

  int get remainingSeconds => (plannedSeconds - elapsedSeconds).clamp(0, plannedSeconds);

  PomodoroState copyWith({
    PomodoroMode? mode,
    PomodoroStatus? status,
    int? plannedSeconds,
    int? elapsedSeconds,
    int? bindTodoId,
    DateTime? currentSessionStartAt,
    PomodoroStats? stats,
    String? error,
  }) {
    return PomodoroState(
      mode: mode ?? this.mode,
      status: status ?? this.status,
      plannedSeconds: plannedSeconds ?? this.plannedSeconds,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      bindTodoId: bindTodoId ?? this.bindTodoId,
      currentSessionStartAt: currentSessionStartAt ?? this.currentSessionStartAt,
      stats: stats ?? this.stats,
      error: error,
    );
  }
}

final pomodoroControllerProvider =
    StateNotifierProvider<PomodoroController, PomodoroState>((ref) {
      return PomodoroController(ref)..initialize();
    });

class PomodoroController extends StateNotifier<PomodoroState> {
  PomodoroController(this._ref)
    : super(
        PomodoroState(
          mode: PomodoroMode.focus,
          status: PomodoroStatus.idle,
          plannedSeconds: 25 * 60,
          elapsedSeconds: 0,
          stats: PomodoroStats(
            todayCompletedPomodoros: 0,
            todayFocusMinutes: 0,
            weekFocusMinutes: 0,
          ),
        ),
      );

  final Ref _ref;
  Timer? _timer;

  Future<void> initialize() async {
    _restoreFromRuntime();
    if (PomodoroRuntimeStore.snapshot == null) {
      await _refreshPlannedByMode(state.mode);
    }
    await _refreshStats();
    if (state.status == PomodoroStatus.running && _timer == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    }
  }

  Future<void> _refreshPlannedByMode(PomodoroMode mode) async {
    try {
      final settings = await _ref.read(settingsRepositoryProvider).getSettings();
      final minutes = switch (mode) {
        PomodoroMode.focus => settings.focusMinutes,
        PomodoroMode.shortBreak => settings.shortBreakMinutes,
        PomodoroMode.longBreak => settings.longBreakMinutes,
      };
      state = state.copyWith(plannedSeconds: minutes * 60, error: null);
      _persistRuntime();
    } catch (e) {
      state = state.copyWith(error: ErrorMessage.fromException(e).message);
    }
  }

  Future<void> _refreshStats() async {
    final stats = await _ref.read(pomodoroRepositoryProvider).getStats(DateTime.now());
    state = state.copyWith(stats: stats);
  }

  void bindTodo(int? todoId) {
    state = state.copyWith(bindTodoId: todoId);
    _persistRuntime();
  }

  Future<void> changeMode(PomodoroMode mode) async {
    await _storeCurrentIfNeeded(completed: false);
    _timer?.cancel();
    state = state.copyWith(
      mode: mode,
      status: PomodoroStatus.idle,
      elapsedSeconds: 0,
      currentSessionStartAt: null,
    );
    await _refreshPlannedByMode(mode);
    _persistRuntime();
  }

  void start() {
    if (state.status == PomodoroStatus.running) return;
    state = state.copyWith(
      status: PomodoroStatus.running,
      currentSessionStartAt: state.currentSessionStartAt ?? DateTime.now(),
    );
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    _persistRuntime();
  }

  void pause() {
    if (state.status != PomodoroStatus.running) return;
    _timer?.cancel();
    _timer = null;
    state = state.copyWith(status: PomodoroStatus.paused);
    _persistRuntime();
  }

  Future<void> reset() async {
    await _storeCurrentIfNeeded(completed: false);
    _timer?.cancel();
    _timer = null;
    state = state.copyWith(
      status: PomodoroStatus.idle,
      elapsedSeconds: 0,
      currentSessionStartAt: null,
    );
    _persistRuntime();
  }

  static PomodoroMode nextBreakMode({
    required int completedFocusToday,
    required int longBreakEvery,
  }) {
    if (completedFocusToday > 0 && completedFocusToday % longBreakEvery == 0) {
      return PomodoroMode.longBreak;
    }
    return PomodoroMode.shortBreak;
  }

  Future<void> _tick() async {
    final nextElapsed = state.elapsedSeconds + 1;
    if (nextElapsed >= state.plannedSeconds) {
      state = state.copyWith(elapsedSeconds: state.plannedSeconds);
      await _completeSession();
      return;
    }
    state = state.copyWith(elapsedSeconds: nextElapsed);
    _persistRuntime();
  }

  Future<void> _completeSession() async {
    _timer?.cancel();
    _timer = null;
    await _storeCurrentIfNeeded(completed: true);
    await _ref.read(notificationServiceProvider).show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: '番茄钟完成',
      body: state.mode == PomodoroMode.focus ? '专注完成，休息一下吧' : '休息结束，继续加油',
    );
    await _refreshStats();
    final settings = await _ref.read(settingsRepositoryProvider).getSettings();
    if (state.mode == PomodoroMode.focus) {
      final next = nextBreakMode(
        completedFocusToday: state.stats.todayCompletedPomodoros,
        longBreakEvery: settings.longBreakEvery,
      );
      await changeMode(next);
    } else {
      await changeMode(PomodoroMode.focus);
    }
    _persistRuntime();
  }

  Future<void> _storeCurrentIfNeeded({required bool completed}) async {
    if (state.currentSessionStartAt == null || state.elapsedSeconds <= 0) return;
    await _ref.read(pomodoroRepositoryProvider).insertSession(
      PomodoroSession(
        plannedSeconds: state.plannedSeconds,
        elapsedSeconds: state.elapsedSeconds,
        completed: completed,
        startedAt: state.currentSessionStartAt!,
        endedAt: DateTime.now(),
        todoId: state.bindTodoId,
        mode: state.mode,
      ),
    );
    await _refreshStats();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _persistRuntime();
    super.dispose();
  }

  void _restoreFromRuntime() {
    final snap = PomodoroRuntimeStore.snapshot;
    if (snap == null) return;
    final restoredStatus = PomodoroStatus.values.firstWhere(
      (s) => s.name == snap.statusName,
      orElse: () => PomodoroStatus.idle,
    );
    var elapsed = snap.elapsedSeconds;
    if (restoredStatus == PomodoroStatus.running) {
      elapsed += DateTime.now().difference(snap.savedAt).inSeconds;
    }
    elapsed = elapsed.clamp(0, snap.plannedSeconds);
    state = state.copyWith(
      mode: snap.mode,
      status: restoredStatus,
      plannedSeconds: snap.plannedSeconds,
      elapsedSeconds: elapsed,
      bindTodoId: snap.bindTodoId,
      currentSessionStartAt: snap.currentSessionStartAt,
    );
    if (elapsed >= snap.plannedSeconds) {
      state = state.copyWith(
        status: PomodoroStatus.idle,
        elapsedSeconds: 0,
        currentSessionStartAt: null,
      );
    }
  }

  void _persistRuntime() {
    PomodoroRuntimeStore.snapshot = PomodoroRuntimeSnapshot(
      mode: state.mode,
      statusName: state.status.name,
      plannedSeconds: state.plannedSeconds,
      elapsedSeconds: state.elapsedSeconds,
      bindTodoId: state.bindTodoId,
      currentSessionStartAt: state.currentSessionStartAt,
      savedAt: DateTime.now(),
    );
  }
}
