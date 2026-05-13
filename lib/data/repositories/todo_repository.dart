import 'package:desktop_tools_flutter/domain/models/todo_item.dart';
import 'package:sqflite/sqflite.dart';

class TodoRepository {
  TodoRepository(this._db);

  final Database _db;

  Future<List<TodoItem>> getAll() async {
    final rows = await _db.query('todos', orderBy: 'created_at DESC');
    return rows.map(_toModel).toList();
  }

  Future<List<TodoItem>> getPending() async {
    final rows = await _db.query(
      'todos',
      where: 'completed = 0',
      orderBy: 'due_at IS NULL, due_at ASC',
    );
    return rows.map(_toModel).toList();
  }

  Future<int> insert(TodoItem item) async {
    return _db.insert('todos', _toMap(item));
  }

  Future<void> update(TodoItem item) async {
    await _db.update('todos', _toMap(item), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> delete(int id) async {
    await _db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  TodoItem _toModel(Map<String, Object?> row) {
    return TodoItem(
      id: row['id'] as int,
      title: row['title'] as String,
      notes: row['notes'] as String?,
      dueAt: row['due_at'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(row['due_at'] as int),
      priority: TodoPriority.values.firstWhere(
        (p) => p.name == row['priority'],
        orElse: () => TodoPriority.normal,
      ),
      completed: (row['completed'] as int) == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(row['created_at'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(row['updated_at'] as int),
    );
  }

  Map<String, Object?> _toMap(TodoItem item) {
    return {
      if (item.id != null) 'id': item.id,
      'title': item.title,
      'notes': item.notes,
      'due_at': item.dueAt?.millisecondsSinceEpoch,
      'priority': item.priority.name,
      'completed': item.completed ? 1 : 0,
      'created_at': item.createdAt.millisecondsSinceEpoch,
      'updated_at': item.updatedAt.millisecondsSinceEpoch,
    };
  }
}

