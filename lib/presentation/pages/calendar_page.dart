import 'package:desktop_tools_flutter/application/calendar/calendar_controller.dart';
import 'package:desktop_tools_flutter/domain/models/calendar_day_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() => ref.read(calendarControllerProvider.notifier).today());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calendarControllerProvider);
    final controller = ref.read(calendarControllerProvider.notifier);
    final monthText = DateFormat('yyyy-MM').format(state.month);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(onPressed: controller.previousMonth, icon: const Icon(Icons.chevron_left)),
            Text(monthText, style: Theme.of(context).textTheme.titleLarge),
            IconButton(onPressed: controller.nextMonth, icon: const Icon(Icons.chevron_right)),
            const SizedBox(width: 8),
            OutlinedButton(onPressed: controller.today, child: const Text('回到今天')),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.days.length,
            itemBuilder: (_, i) {
              final item = state.days[i];
              final selected = state.selected?.date.day == item.date.day;
              final color = switch (item.type) {
                CalendarDayType.holiday => Colors.red.shade100,
                CalendarDayType.adjustedWorkday => Colors.orange.shade100,
                CalendarDayType.weekend => Colors.blue.shade50,
                _ => Colors.grey.shade100,
              };
              return InkWell(
                onTap: () => controller.selectDay(item.date.day),
                child: Container(
                  decoration: BoxDecoration(
                    color: selected ? Colors.teal.shade100 : color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${item.date.day}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Text(item.lunarShort, style: const TextStyle(fontSize: 11)),
                      if (item.label?.isNotEmpty == true)
                        Text(
                          item.label!,
                          style: const TextStyle(fontSize: 10, color: Colors.red),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (state.selected != null) ...[
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd').format(state.selected!.date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text('星期: ${state.selected!.weekdayText}'),
                  Text('农历: ${state.selected!.lunarFull}'),
                  Text('日类型: ${_typeText(state.selected!.type)}'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _typeText(CalendarDayType type) {
    return switch (type) {
      CalendarDayType.holiday => '节假日',
      CalendarDayType.adjustedWorkday => '调休工作日',
      CalendarDayType.weekend => '周末',
      CalendarDayType.normal => '工作日',
    };
  }
}

