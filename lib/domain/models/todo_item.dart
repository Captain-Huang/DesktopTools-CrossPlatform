import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

enum TodoPriority { low, normal, high }

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    int? id,
    required String title,
    String? notes,
    DateTime? dueAt,
    @Default(TodoPriority.normal) TodoPriority priority,
    @Default(false) bool completed,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);
}

