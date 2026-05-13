import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/domain/models/todo_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TodoFilter { pending, all, completed }

final todoFilterProvider = StateProvider<TodoFilter>((_) => TodoFilter.pending);

final todoControllerProvider =
    StateNotifierProvider<TodoController, AsyncValue<List<TodoItem>>>((ref) {
      return TodoController(ref)..load();
    });

final filteredTodosProvider = Provider<List<TodoItem>>((ref) {
  final todosAsync = ref.watch(todoControllerProvider);
  final filter = ref.watch(todoFilterProvider);
  final todos = todosAsync.value ?? <TodoItem>[];
  switch (filter) {
    case TodoFilter.pending:
      return todos.where((e) => !e.completed).toList();
    case TodoFilter.completed:
      return todos.where((e) => e.completed).toList();
    case TodoFilter.all:
      return todos;
  }
});

class TodoController extends StateNotifier<AsyncValue<List<TodoItem>>> {
  TodoController(this._ref) : super(const AsyncValue.loading());

  final Ref _ref;

  Future<void> load() async {
    try {
      final todos = await _ref.read(todoRepositoryProvider).getAll();
      state = AsyncValue.data(todos);
    } catch (e, st) {
      state = AsyncValue.error(ErrorMessage.fromException(e), st);
    }
  }

  Future<void> create({
    required String title,
    String? notes,
    DateTime? dueAt,
    TodoPriority priority = TodoPriority.normal,
  }) async {
    final now = DateTime.now();
    final item = TodoItem(
      title: title,
      notes: notes,
      dueAt: dueAt,
      priority: priority,
      createdAt: now,
      updatedAt: now,
    );
    await _ref.read(todoRepositoryProvider).insert(item);
    await load();
  }

  Future<void> save(TodoItem item) async {
    await _ref
        .read(todoRepositoryProvider)
        .update(item.copyWith(updatedAt: DateTime.now()));
    await load();
  }

  Future<void> toggleCompleted(TodoItem item, bool value) async {
    await save(item.copyWith(completed: value));
  }

  Future<void> remove(int id) async {
    await _ref.read(todoRepositoryProvider).delete(id);
    await load();
  }
}

