import 'package:desktop_tools_flutter/application/todos/todo_controller.dart';
import 'package:desktop_tools_flutter/domain/models/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosState = ref.watch(todoControllerProvider);
    final controller = ref.read(todoControllerProvider.notifier);
    final filtered = ref.watch(filteredTodosProvider);
    final filter = ref.watch(todoFilterProvider);

    return Column(
      children: [
        Row(
          children: [
            DropdownButton<TodoFilter>(
              value: filter,
              onChanged: (value) {
                if (value != null) {
                  ref.read(todoFilterProvider.notifier).state = value;
                }
              },
              items: const [
                DropdownMenuItem(value: TodoFilter.pending, child: Text('未完成')),
                DropdownMenuItem(value: TodoFilter.all, child: Text('全部')),
                DropdownMenuItem(value: TodoFilter.completed, child: Text('已完成')),
              ],
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: () => _openTodoDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('新增'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: todosState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('$e')),
            data: (_) {
              if (filtered.isEmpty) return const Center(child: Text('暂无待办'));
              return ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final item = filtered[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: item.completed,
                        onChanged: (v) => controller.toggleCompleted(item, v ?? false),
                      ),
                      title: Text(item.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.notes?.isNotEmpty == true) Text(item.notes!),
                          Text('优先级: ${item.priority.name}'),
                          if (item.dueAt != null)
                            Text('到期: ${DateFormat('MM-dd HH:mm').format(item.dueAt!)}'),
                        ],
                      ),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _openTodoDialog(context, ref, initial: item),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.remove(item.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _openTodoDialog(
    BuildContext context,
    WidgetRef ref, {
    TodoItem? initial,
  }) async {
    final titleCtrl = TextEditingController(text: initial?.title ?? '');
    final notesCtrl = TextEditingController(text: initial?.notes ?? '');
    var dueAt = initial?.dueAt;
    var priority = initial?.priority ?? TodoPriority.normal;

    await showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(initial == null ? '新增待办' : '编辑待办'),
              content: SizedBox(
                width: 420,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleCtrl,
                      decoration: const InputDecoration(labelText: '标题(必填)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: notesCtrl,
                      decoration: const InputDecoration(labelText: '备注'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<TodoPriority>(
                      initialValue: priority,
                      onChanged: (v) => setState(() => priority = v ?? TodoPriority.normal),
                      items: const [
                        DropdownMenuItem(value: TodoPriority.low, child: Text('low')),
                        DropdownMenuItem(value: TodoPriority.normal, child: Text('normal')),
                        DropdownMenuItem(value: TodoPriority.high, child: Text('high')),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            dueAt == null ? '未设置到期时间' : DateFormat('yyyy-MM-dd HH:mm').format(dueAt!),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2035),
                              initialDate: dueAt ?? DateTime.now(),
                            );
                            if (date == null || !context.mounted) return;
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(dueAt ?? DateTime.now()),
                            );
                            if (time == null) return;
                            setState(() {
                              dueAt = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                time.hour,
                                time.minute,
                              );
                            });
                          },
                          child: const Text('设置到期'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
                FilledButton(
                  onPressed: () async {
                    final title = titleCtrl.text.trim();
                    if (title.isEmpty) return;
                    final c = ref.read(todoControllerProvider.notifier);
                    if (initial == null) {
                      await c.create(
                        title: title,
                        notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
                        dueAt: dueAt,
                        priority: priority,
                      );
                    } else {
                      await c.save(
                        initial.copyWith(
                          title: title,
                          notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
                          dueAt: dueAt,
                          priority: priority,
                        ),
                      );
                    }
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('保存'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

