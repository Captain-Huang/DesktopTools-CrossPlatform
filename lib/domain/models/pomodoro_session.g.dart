// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PomodoroSessionImpl _$$PomodoroSessionImplFromJson(
  Map<String, dynamic> json,
) => _$PomodoroSessionImpl(
  id: (json['id'] as num?)?.toInt(),
  plannedSeconds: (json['plannedSeconds'] as num).toInt(),
  elapsedSeconds: (json['elapsedSeconds'] as num).toInt(),
  completed: json['completed'] as bool,
  startedAt: DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  todoId: (json['todoId'] as num?)?.toInt(),
  mode: $enumDecode(_$PomodoroModeEnumMap, json['mode']),
);

Map<String, dynamic> _$$PomodoroSessionImplToJson(
  _$PomodoroSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'plannedSeconds': instance.plannedSeconds,
  'elapsedSeconds': instance.elapsedSeconds,
  'completed': instance.completed,
  'startedAt': instance.startedAt.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'todoId': instance.todoId,
  'mode': _$PomodoroModeEnumMap[instance.mode]!,
};

const _$PomodoroModeEnumMap = {
  PomodoroMode.focus: 'focus',
  PomodoroMode.shortBreak: 'shortBreak',
  PomodoroMode.longBreak: 'longBreak',
};
