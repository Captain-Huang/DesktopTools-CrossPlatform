enum CalendarDayType { normal, weekend, holiday, adjustedWorkday }

class CalendarDayInfo {
  CalendarDayInfo({
    required this.date,
    required this.weekdayText,
    required this.lunarShort,
    required this.lunarFull,
    required this.type,
    this.label,
  });

  final DateTime date;
  final String weekdayText;
  final String lunarShort;
  final String lunarFull;
  final CalendarDayType type;
  final String? label;
}

