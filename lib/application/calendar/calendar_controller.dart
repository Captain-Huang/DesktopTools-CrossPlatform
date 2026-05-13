import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/domain/models/calendar_day_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarState {
  CalendarState({
    required this.month,
    required this.days,
    this.selected,
    this.error,
  });

  final DateTime month;
  final List<CalendarDayInfo> days;
  final CalendarDayInfo? selected;
  final String? error;

  CalendarState copyWith({
    DateTime? month,
    List<CalendarDayInfo>? days,
    CalendarDayInfo? selected,
    String? error,
  }) {
    return CalendarState(
      month: month ?? this.month,
      days: days ?? this.days,
      selected: selected ?? this.selected,
      error: error,
    );
  }
}

final calendarControllerProvider =
    StateNotifierProvider<CalendarController, CalendarState>((ref) {
      final now = DateTime.now();
      final initial = DateTime(now.year, now.month, 1);
      return CalendarController(ref, initial)..load(initial);
    });

class CalendarController extends StateNotifier<CalendarState> {
  CalendarController(this._ref, DateTime month)
    : super(CalendarState(month: month, days: const []));

  final Ref _ref;

  Future<void> load(DateTime month) async {
    try {
      final days = await _ref.read(calendarRepositoryProvider).getMonth(month);
      state = state.copyWith(
        month: month,
        days: days,
        selected: days.isEmpty ? null : days.first,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: ErrorMessage.fromException(e).message);
    }
  }

  Future<void> previousMonth() async {
    await load(DateTime(state.month.year, state.month.month - 1, 1));
  }

  Future<void> nextMonth() async {
    await load(DateTime(state.month.year, state.month.month + 1, 1));
  }

  Future<void> today() async {
    final now = DateTime.now();
    await load(DateTime(now.year, now.month, 1));
    selectDay(now.day);
  }

  void selectDay(int day) {
    final item = state.days.where((d) => d.date.day == day).firstOrNull;
    if (item != null) {
      state = state.copyWith(selected: item);
    }
  }
}

extension _CalendarFirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

