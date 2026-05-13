import 'dart:convert';

import 'package:desktop_tools_flutter/core/calendar/lunar_calendar.dart';
import 'package:desktop_tools_flutter/domain/models/calendar_day_info.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CalendarRepository {
  CalendarRepository();

  Map<String, dynamic>? _cache;

  Future<List<CalendarDayInfo>> getMonth(DateTime month) async {
    final data = await _load();
    final holidayMap = <String, Map<String, dynamic>>{};
    for (final item in (data['days'] as List<dynamic>)) {
      final row = item as Map<String, dynamic>;
      holidayMap['${row['date']}'] = row;
    }

    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 0);
    final list = <CalendarDayInfo>[];

    for (var day = start.day; day <= end.day; day++) {
      final date = DateTime(month.year, month.month, day);
      final key = DateFormat('yyyy-MM-dd').format(date);
      final ext = holidayMap[key];
      final lunar = LunarCalendar.fromSolar(date);

      final type = switch (ext?['type']) {
        'holiday' => CalendarDayType.holiday,
        'adjusted_workday' => CalendarDayType.adjustedWorkday,
        _ => (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday)
            ? CalendarDayType.weekend
            : CalendarDayType.normal,
      };

      list.add(
        CalendarDayInfo(
          date: date,
          weekdayText: _weekdayText(date.weekday),
          lunarShort: lunar.shortText,
          lunarFull: lunar.fullText,
          type: type,
          label: ext?['name'] as String?,
        ),
      );
    }
    return list;
  }

  Future<Map<String, dynamic>> _load() async {
    if (_cache != null) return _cache!;
    final raw = await rootBundle.loadString('assets/holidays/holidays_2025_2026.json');
    _cache = jsonDecode(raw) as Map<String, dynamic>;
    return _cache!;
  }

  String _weekdayText(int weekday) {
    const texts = ['一', '二', '三', '四', '五', '六', '日'];
    return '周${texts[weekday - 1]}';
  }
}

