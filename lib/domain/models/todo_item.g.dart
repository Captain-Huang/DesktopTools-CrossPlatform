// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoItemImpl _$$TodoItemImplFromJson(Map<String, dynamic> json) =>
    _$TodoItemImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      notes: json['notes'] as String?,
      dueAt: json['dueAt'] == null
          ? null
          : DateTime.parse(json['dueAt'] as String),
      priority:
          $enumDecodeNullable(_$TodoPriorityEnumMap, json['priority']) ??
          TodoPriority.normal,
      completed: json['completed'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TodoItemImplToJson(_$TodoItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'notes': instance.notes,
      'dueAt': instance.dueAt?.toIso8601String(),
      'priority': _$TodoPriorityEnumMap[instance.priority]!,
      'completed': instance.completed,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TodoPriorityEnumMap = {
  TodoPriority.low: 'low',
  TodoPriority.normal: 'normal',
  TodoPriority.high: 'high',
};
