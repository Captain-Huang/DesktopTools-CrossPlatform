// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PomodoroSession _$PomodoroSessionFromJson(Map<String, dynamic> json) {
  return _PomodoroSession.fromJson(json);
}

/// @nodoc
mixin _$PomodoroSession {
  int? get id => throw _privateConstructorUsedError;
  int get plannedSeconds => throw _privateConstructorUsedError;
  int get elapsedSeconds => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  int? get todoId => throw _privateConstructorUsedError;
  PomodoroMode get mode => throw _privateConstructorUsedError;

  /// Serializes this PomodoroSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PomodoroSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PomodoroSessionCopyWith<PomodoroSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroSessionCopyWith<$Res> {
  factory $PomodoroSessionCopyWith(
    PomodoroSession value,
    $Res Function(PomodoroSession) then,
  ) = _$PomodoroSessionCopyWithImpl<$Res, PomodoroSession>;
  @useResult
  $Res call({
    int? id,
    int plannedSeconds,
    int elapsedSeconds,
    bool completed,
    DateTime startedAt,
    DateTime? endedAt,
    int? todoId,
    PomodoroMode mode,
  });
}

/// @nodoc
class _$PomodoroSessionCopyWithImpl<$Res, $Val extends PomodoroSession>
    implements $PomodoroSessionCopyWith<$Res> {
  _$PomodoroSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PomodoroSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? plannedSeconds = null,
    Object? elapsedSeconds = null,
    Object? completed = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? todoId = freezed,
    Object? mode = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            plannedSeconds: null == plannedSeconds
                ? _value.plannedSeconds
                : plannedSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            elapsedSeconds: null == elapsedSeconds
                ? _value.elapsedSeconds
                : elapsedSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endedAt: freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            todoId: freezed == todoId
                ? _value.todoId
                : todoId // ignore: cast_nullable_to_non_nullable
                      as int?,
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as PomodoroMode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PomodoroSessionImplCopyWith<$Res>
    implements $PomodoroSessionCopyWith<$Res> {
  factory _$$PomodoroSessionImplCopyWith(
    _$PomodoroSessionImpl value,
    $Res Function(_$PomodoroSessionImpl) then,
  ) = __$$PomodoroSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int plannedSeconds,
    int elapsedSeconds,
    bool completed,
    DateTime startedAt,
    DateTime? endedAt,
    int? todoId,
    PomodoroMode mode,
  });
}

/// @nodoc
class __$$PomodoroSessionImplCopyWithImpl<$Res>
    extends _$PomodoroSessionCopyWithImpl<$Res, _$PomodoroSessionImpl>
    implements _$$PomodoroSessionImplCopyWith<$Res> {
  __$$PomodoroSessionImplCopyWithImpl(
    _$PomodoroSessionImpl _value,
    $Res Function(_$PomodoroSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PomodoroSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? plannedSeconds = null,
    Object? elapsedSeconds = null,
    Object? completed = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? todoId = freezed,
    Object? mode = null,
  }) {
    return _then(
      _$PomodoroSessionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        plannedSeconds: null == plannedSeconds
            ? _value.plannedSeconds
            : plannedSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        elapsedSeconds: null == elapsedSeconds
            ? _value.elapsedSeconds
            : elapsedSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endedAt: freezed == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        todoId: freezed == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as int?,
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as PomodoroMode,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PomodoroSessionImpl implements _PomodoroSession {
  const _$PomodoroSessionImpl({
    this.id,
    required this.plannedSeconds,
    required this.elapsedSeconds,
    required this.completed,
    required this.startedAt,
    this.endedAt,
    this.todoId,
    required this.mode,
  });

  factory _$PomodoroSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PomodoroSessionImplFromJson(json);

  @override
  final int? id;
  @override
  final int plannedSeconds;
  @override
  final int elapsedSeconds;
  @override
  final bool completed;
  @override
  final DateTime startedAt;
  @override
  final DateTime? endedAt;
  @override
  final int? todoId;
  @override
  final PomodoroMode mode;

  @override
  String toString() {
    return 'PomodoroSession(id: $id, plannedSeconds: $plannedSeconds, elapsedSeconds: $elapsedSeconds, completed: $completed, startedAt: $startedAt, endedAt: $endedAt, todoId: $todoId, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.plannedSeconds, plannedSeconds) ||
                other.plannedSeconds == plannedSeconds) &&
            (identical(other.elapsedSeconds, elapsedSeconds) ||
                other.elapsedSeconds == elapsedSeconds) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    plannedSeconds,
    elapsedSeconds,
    completed,
    startedAt,
    endedAt,
    todoId,
    mode,
  );

  /// Create a copy of PomodoroSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroSessionImplCopyWith<_$PomodoroSessionImpl> get copyWith =>
      __$$PomodoroSessionImplCopyWithImpl<_$PomodoroSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PomodoroSessionImplToJson(this);
  }
}

abstract class _PomodoroSession implements PomodoroSession {
  const factory _PomodoroSession({
    final int? id,
    required final int plannedSeconds,
    required final int elapsedSeconds,
    required final bool completed,
    required final DateTime startedAt,
    final DateTime? endedAt,
    final int? todoId,
    required final PomodoroMode mode,
  }) = _$PomodoroSessionImpl;

  factory _PomodoroSession.fromJson(Map<String, dynamic> json) =
      _$PomodoroSessionImpl.fromJson;

  @override
  int? get id;
  @override
  int get plannedSeconds;
  @override
  int get elapsedSeconds;
  @override
  bool get completed;
  @override
  DateTime get startedAt;
  @override
  DateTime? get endedAt;
  @override
  int? get todoId;
  @override
  PomodoroMode get mode;

  /// Create a copy of PomodoroSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PomodoroSessionImplCopyWith<_$PomodoroSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
