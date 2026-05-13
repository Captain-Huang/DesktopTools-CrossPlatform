import 'package:desktop_tools_flutter/application/pomodoro/pomodoro_controller.dart';
import 'package:desktop_tools_flutter/application/todos/todo_controller.dart';
import 'package:desktop_tools_flutter/domain/models/pomodoro_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PomodoroPage extends ConsumerWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pomodoroControllerProvider);
    final controller = ref.read(pomodoroControllerProvider.notifier);
    final todos = ref.watch(todoControllerProvider).value ?? [];
    final minutes = (state.remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (state.remainingSeconds % 60).toString().padLeft(2, '0');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                DropdownButton<PomodoroMode>(
                  value: state.mode,
                  onChanged: (v) {
                    if (v != null) {
                      controller.changeMode(v);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: PomodoroMode.focus, child: Text('专注')),
                    DropdownMenuItem(value: PomodoroMode.shortBreak, child: Text('短休')),
                    DropdownMenuItem(value: PomodoroMode.longBreak, child: Text('长休')),
                  ],
                ),
                SizedBox(
                  width: 320,
                  child: DropdownButton<int?>(
                    value: state.bindTodoId,
                    isExpanded: true,
                    onChanged: controller.bindTodo,
                    items: [
                      const DropdownMenuItem<int?>(value: null, child: Text('不绑定')),
                      for (final todo in todos.where((e) => !e.completed && e.id != null))
                        DropdownMenuItem<int?>(
                          value: todo.id,
                          child: Text(todo.title, overflow: TextOverflow.ellipsis),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                '$minutes:$seconds',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: controller.start,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('开始'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: controller.pause,
                  icon: const Icon(Icons.pause),
                  label: const Text('暂停'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: controller.reset,
                  icon: const Icon(Icons.replay),
                  label: const Text('重置'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatItem(title: '今日完成番茄', value: '${state.stats.todayCompletedPomodoros}'),
                    _StatItem(title: '今日专注分钟', value: '${state.stats.todayFocusMinutes}'),
                    _StatItem(title: '本周专注分钟', value: '${state.stats.weekFocusMinutes}'),
                  ],
                ),
              ),
            ),
            if (state.error?.isNotEmpty == true) ...[
              const SizedBox(height: 16),
              Text(state.error!, style: const TextStyle(color: Colors.red)),
            ],
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        const SizedBox(height: 6),
        Text(value, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
