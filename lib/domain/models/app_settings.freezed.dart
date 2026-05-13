// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  int get focusMinutes => throw _privateConstructorUsedError;
  int get shortBreakMinutes => throw _privateConstructorUsedError;
  int get longBreakMinutes => throw _privateConstructorUsedError;
  int get longBreakEvery => throw _privateConstructorUsedError;
  int get todoReminderMinutes => throw _privateConstructorUsedError;
  String get weatherCity => throw _privateConstructorUsedError;

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
    AppSettings value,
    $Res Function(AppSettings) then,
  ) = _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call({
    int focusMinutes,
    int shortBreakMinutes,
    int longBreakMinutes,
    int longBreakEvery,
    int todoReminderMinutes,
    String weatherCity,
  });
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusMinutes = null,
    Object? shortBreakMinutes = null,
    Object? longBreakMinutes = null,
    Object? longBreakEvery = null,
    Object? todoReminderMinutes = null,
    Object? weatherCity = null,
  }) {
    return _then(
      _value.copyWith(
            focusMinutes: null == focusMinutes
                ? _value.focusMinutes
                : focusMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            shortBreakMinutes: null == shortBreakMinutes
                ? _value.shortBreakMinutes
                : shortBreakMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            longBreakMinutes: null == longBreakMinutes
                ? _value.longBreakMinutes
                : longBreakMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            longBreakEvery: null == longBreakEvery
                ? _value.longBreakEvery
                : longBreakEvery // ignore: cast_nullable_to_non_nullable
                      as int,
            todoReminderMinutes: null == todoReminderMinutes
                ? _value.todoReminderMinutes
                : todoReminderMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            weatherCity: null == weatherCity
                ? _value.weatherCity
                : weatherCity // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
    _$AppSettingsImpl value,
    $Res Function(_$AppSettingsImpl) then,
  ) = __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int focusMinutes,
    int shortBreakMinutes,
    int longBreakMinutes,
    int longBreakEvery,
    int todoReminderMinutes,
    String weatherCity,
  });
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
    _$AppSettingsImpl _value,
    $Res Function(_$AppSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusMinutes = null,
    Object? shortBreakMinutes = null,
    Object? longBreakMinutes = null,
    Object? longBreakEvery = null,
    Object? todoReminderMinutes = null,
    Object? weatherCity = null,
  }) {
    return _then(
      _$AppSettingsImpl(
        focusMinutes: null == focusMinutes
            ? _value.focusMinutes
            : focusMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        shortBreakMinutes: null == shortBreakMinutes
            ? _value.shortBreakMinutes
            : shortBreakMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        longBreakMinutes: null == longBreakMinutes
            ? _value.longBreakMinutes
            : longBreakMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        longBreakEvery: null == longBreakEvery
            ? _value.longBreakEvery
            : longBreakEvery // ignore: cast_nullable_to_non_nullable
                  as int,
        todoReminderMinutes: null == todoReminderMinutes
            ? _value.todoReminderMinutes
            : todoReminderMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        weatherCity: null == weatherCity
            ? _value.weatherCity
            : weatherCity // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl({
    required this.focusMinutes,
    required this.shortBreakMinutes,
    required this.longBreakMinutes,
    required this.longBreakEvery,
    required this.todoReminderMinutes,
    required this.weatherCity,
  });

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  final int focusMinutes;
  @override
  final int shortBreakMinutes;
  @override
  final int longBreakMinutes;
  @override
  final int longBreakEvery;
  @override
  final int todoReminderMinutes;
  @override
  final String weatherCity;

  @override
  String toString() {
    return 'AppSettings(focusMinutes: $focusMinutes, shortBreakMinutes: $shortBreakMinutes, longBreakMinutes: $longBreakMinutes, longBreakEvery: $longBreakEvery, todoReminderMinutes: $todoReminderMinutes, weatherCity: $weatherCity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.focusMinutes, focusMinutes) ||
                other.focusMinutes == focusMinutes) &&
            (identical(other.shortBreakMinutes, shortBreakMinutes) ||
                other.shortBreakMinutes == shortBreakMinutes) &&
            (identical(other.longBreakMinutes, longBreakMinutes) ||
                other.longBreakMinutes == longBreakMinutes) &&
            (identical(other.longBreakEvery, longBreakEvery) ||
                other.longBreakEvery == longBreakEvery) &&
            (identical(other.todoReminderMinutes, todoReminderMinutes) ||
                other.todoReminderMinutes == todoReminderMinutes) &&
            (identical(other.weatherCity, weatherCity) ||
                other.weatherCity == weatherCity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    focusMinutes,
    shortBreakMinutes,
    longBreakMinutes,
    longBreakEvery,
    todoReminderMinutes,
    weatherCity,
  );

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(this);
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings({
    required final int focusMinutes,
    required final int shortBreakMinutes,
    required final int longBreakMinutes,
    required final int longBreakEvery,
    required final int todoReminderMinutes,
    required final String weatherCity,
  }) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  int get focusMinutes;
  @override
  int get shortBreakMinutes;
  @override
  int get longBreakMinutes;
  @override
  int get longBreakEvery;
  @override
  int get todoReminderMinutes;
  @override
  String get weatherCity;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
