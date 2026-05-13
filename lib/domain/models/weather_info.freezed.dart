// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) {
  return _AirQuality.fromJson(json);
}

/// @nodoc
mixin _$AirQuality {
  int? get aqi => throw _privateConstructorUsedError;
  double? get pm25 => throw _privateConstructorUsedError;
  double? get pm10 => throw _privateConstructorUsedError;

  /// Serializes this AirQuality to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirQualityCopyWith<AirQuality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirQualityCopyWith<$Res> {
  factory $AirQualityCopyWith(
    AirQuality value,
    $Res Function(AirQuality) then,
  ) = _$AirQualityCopyWithImpl<$Res, AirQuality>;
  @useResult
  $Res call({int? aqi, double? pm25, double? pm10});
}

/// @nodoc
class _$AirQualityCopyWithImpl<$Res, $Val extends AirQuality>
    implements $AirQualityCopyWith<$Res> {
  _$AirQualityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aqi = freezed,
    Object? pm25 = freezed,
    Object? pm10 = freezed,
  }) {
    return _then(
      _value.copyWith(
            aqi: freezed == aqi
                ? _value.aqi
                : aqi // ignore: cast_nullable_to_non_nullable
                      as int?,
            pm25: freezed == pm25
                ? _value.pm25
                : pm25 // ignore: cast_nullable_to_non_nullable
                      as double?,
            pm10: freezed == pm10
                ? _value.pm10
                : pm10 // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AirQualityImplCopyWith<$Res>
    implements $AirQualityCopyWith<$Res> {
  factory _$$AirQualityImplCopyWith(
    _$AirQualityImpl value,
    $Res Function(_$AirQualityImpl) then,
  ) = __$$AirQualityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? aqi, double? pm25, double? pm10});
}

/// @nodoc
class __$$AirQualityImplCopyWithImpl<$Res>
    extends _$AirQualityCopyWithImpl<$Res, _$AirQualityImpl>
    implements _$$AirQualityImplCopyWith<$Res> {
  __$$AirQualityImplCopyWithImpl(
    _$AirQualityImpl _value,
    $Res Function(_$AirQualityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aqi = freezed,
    Object? pm25 = freezed,
    Object? pm10 = freezed,
  }) {
    return _then(
      _$AirQualityImpl(
        aqi: freezed == aqi
            ? _value.aqi
            : aqi // ignore: cast_nullable_to_non_nullable
                  as int?,
        pm25: freezed == pm25
            ? _value.pm25
            : pm25 // ignore: cast_nullable_to_non_nullable
                  as double?,
        pm10: freezed == pm10
            ? _value.pm10
            : pm10 // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AirQualityImpl implements _AirQuality {
  const _$AirQualityImpl({this.aqi, this.pm25, this.pm10});

  factory _$AirQualityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirQualityImplFromJson(json);

  @override
  final int? aqi;
  @override
  final double? pm25;
  @override
  final double? pm10;

  @override
  String toString() {
    return 'AirQuality(aqi: $aqi, pm25: $pm25, pm10: $pm10)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirQualityImpl &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.pm25, pm25) || other.pm25 == pm25) &&
            (identical(other.pm10, pm10) || other.pm10 == pm10));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, aqi, pm25, pm10);

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirQualityImplCopyWith<_$AirQualityImpl> get copyWith =>
      __$$AirQualityImplCopyWithImpl<_$AirQualityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirQualityImplToJson(this);
  }
}

abstract class _AirQuality implements AirQuality {
  const factory _AirQuality({
    final int? aqi,
    final double? pm25,
    final double? pm10,
  }) = _$AirQualityImpl;

  factory _AirQuality.fromJson(Map<String, dynamic> json) =
      _$AirQualityImpl.fromJson;

  @override
  int? get aqi;
  @override
  double? get pm25;
  @override
  double? get pm10;

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirQualityImplCopyWith<_$AirQualityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) {
  return _DailyWeather.fromJson(json);
}

/// @nodoc
mixin _$DailyWeather {
  DateTime get date => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this DailyWeather to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyWeatherCopyWith<DailyWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyWeatherCopyWith<$Res> {
  factory $DailyWeatherCopyWith(
    DailyWeather value,
    $Res Function(DailyWeather) then,
  ) = _$DailyWeatherCopyWithImpl<$Res, DailyWeather>;
  @useResult
  $Res call({DateTime date, double minTemp, double maxTemp, String summary});
}

/// @nodoc
class _$DailyWeatherCopyWithImpl<$Res, $Val extends DailyWeather>
    implements $DailyWeatherCopyWith<$Res> {
  _$DailyWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? summary = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            minTemp: null == minTemp
                ? _value.minTemp
                : minTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            maxTemp: null == maxTemp
                ? _value.maxTemp
                : maxTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyWeatherImplCopyWith<$Res>
    implements $DailyWeatherCopyWith<$Res> {
  factory _$$DailyWeatherImplCopyWith(
    _$DailyWeatherImpl value,
    $Res Function(_$DailyWeatherImpl) then,
  ) = __$$DailyWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double minTemp, double maxTemp, String summary});
}

/// @nodoc
class __$$DailyWeatherImplCopyWithImpl<$Res>
    extends _$DailyWeatherCopyWithImpl<$Res, _$DailyWeatherImpl>
    implements _$$DailyWeatherImplCopyWith<$Res> {
  __$$DailyWeatherImplCopyWithImpl(
    _$DailyWeatherImpl _value,
    $Res Function(_$DailyWeatherImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? summary = null,
  }) {
    return _then(
      _$DailyWeatherImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        minTemp: null == minTemp
            ? _value.minTemp
            : minTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        maxTemp: null == maxTemp
            ? _value.maxTemp
            : maxTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyWeatherImpl implements _DailyWeather {
  const _$DailyWeatherImpl({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.summary,
  });

  factory _$DailyWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyWeatherImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double minTemp;
  @override
  final double maxTemp;
  @override
  final String summary;

  @override
  String toString() {
    return 'DailyWeather(date: $date, minTemp: $minTemp, maxTemp: $maxTemp, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyWeatherImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, minTemp, maxTemp, summary);

  /// Create a copy of DailyWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      __$$DailyWeatherImplCopyWithImpl<_$DailyWeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyWeatherImplToJson(this);
  }
}

abstract class _DailyWeather implements DailyWeather {
  const factory _DailyWeather({
    required final DateTime date,
    required final double minTemp,
    required final double maxTemp,
    required final String summary,
  }) = _$DailyWeatherImpl;

  factory _DailyWeather.fromJson(Map<String, dynamic> json) =
      _$DailyWeatherImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get minTemp;
  @override
  double get maxTemp;
  @override
  String get summary;

  /// Create a copy of DailyWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return _WeatherInfo.fromJson(json);
}

/// @nodoc
mixin _$WeatherInfo {
  String get city => throw _privateConstructorUsedError;
  double get currentTemp => throw _privateConstructorUsedError;
  String get currentSummary => throw _privateConstructorUsedError;
  List<DailyWeather> get next7Days => throw _privateConstructorUsedError;
  AirQuality get airQuality => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this WeatherInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherInfoCopyWith<WeatherInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInfoCopyWith<$Res> {
  factory $WeatherInfoCopyWith(
    WeatherInfo value,
    $Res Function(WeatherInfo) then,
  ) = _$WeatherInfoCopyWithImpl<$Res, WeatherInfo>;
  @useResult
  $Res call({
    String city,
    double currentTemp,
    String currentSummary,
    List<DailyWeather> next7Days,
    AirQuality airQuality,
    String source,
  });

  $AirQualityCopyWith<$Res> get airQuality;
}

/// @nodoc
class _$WeatherInfoCopyWithImpl<$Res, $Val extends WeatherInfo>
    implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? currentTemp = null,
    Object? currentSummary = null,
    Object? next7Days = null,
    Object? airQuality = null,
    Object? source = null,
  }) {
    return _then(
      _value.copyWith(
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            currentTemp: null == currentTemp
                ? _value.currentTemp
                : currentTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            currentSummary: null == currentSummary
                ? _value.currentSummary
                : currentSummary // ignore: cast_nullable_to_non_nullable
                      as String,
            next7Days: null == next7Days
                ? _value.next7Days
                : next7Days // ignore: cast_nullable_to_non_nullable
                      as List<DailyWeather>,
            airQuality: null == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQuality,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityCopyWith<$Res> get airQuality {
    return $AirQualityCopyWith<$Res>(_value.airQuality, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherInfoImplCopyWith<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  factory _$$WeatherInfoImplCopyWith(
    _$WeatherInfoImpl value,
    $Res Function(_$WeatherInfoImpl) then,
  ) = __$$WeatherInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String city,
    double currentTemp,
    String currentSummary,
    List<DailyWeather> next7Days,
    AirQuality airQuality,
    String source,
  });

  @override
  $AirQualityCopyWith<$Res> get airQuality;
}

/// @nodoc
class __$$WeatherInfoImplCopyWithImpl<$Res>
    extends _$WeatherInfoCopyWithImpl<$Res, _$WeatherInfoImpl>
    implements _$$WeatherInfoImplCopyWith<$Res> {
  __$$WeatherInfoImplCopyWithImpl(
    _$WeatherInfoImpl _value,
    $Res Function(_$WeatherInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? currentTemp = null,
    Object? currentSummary = null,
    Object? next7Days = null,
    Object? airQuality = null,
    Object? source = null,
  }) {
    return _then(
      _$WeatherInfoImpl(
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        currentTemp: null == currentTemp
            ? _value.currentTemp
            : currentTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        currentSummary: null == currentSummary
            ? _value.currentSummary
            : currentSummary // ignore: cast_nullable_to_non_nullable
                  as String,
        next7Days: null == next7Days
            ? _value._next7Days
            : next7Days // ignore: cast_nullable_to_non_nullable
                  as List<DailyWeather>,
        airQuality: null == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQuality,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherInfoImpl implements _WeatherInfo {
  const _$WeatherInfoImpl({
    required this.city,
    required this.currentTemp,
    required this.currentSummary,
    required final List<DailyWeather> next7Days,
    required this.airQuality,
    required this.source,
  }) : _next7Days = next7Days;

  factory _$WeatherInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherInfoImplFromJson(json);

  @override
  final String city;
  @override
  final double currentTemp;
  @override
  final String currentSummary;
  final List<DailyWeather> _next7Days;
  @override
  List<DailyWeather> get next7Days {
    if (_next7Days is EqualUnmodifiableListView) return _next7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_next7Days);
  }

  @override
  final AirQuality airQuality;
  @override
  final String source;

  @override
  String toString() {
    return 'WeatherInfo(city: $city, currentTemp: $currentTemp, currentSummary: $currentSummary, next7Days: $next7Days, airQuality: $airQuality, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherInfoImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.currentTemp, currentTemp) ||
                other.currentTemp == currentTemp) &&
            (identical(other.currentSummary, currentSummary) ||
                other.currentSummary == currentSummary) &&
            const DeepCollectionEquality().equals(
              other._next7Days,
              _next7Days,
            ) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    city,
    currentTemp,
    currentSummary,
    const DeepCollectionEquality().hash(_next7Days),
    airQuality,
    source,
  );

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      __$$WeatherInfoImplCopyWithImpl<_$WeatherInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherInfoImplToJson(this);
  }
}

abstract class _WeatherInfo implements WeatherInfo {
  const factory _WeatherInfo({
    required final String city,
    required final double currentTemp,
    required final String currentSummary,
    required final List<DailyWeather> next7Days,
    required final AirQuality airQuality,
    required final String source,
  }) = _$WeatherInfoImpl;

  factory _WeatherInfo.fromJson(Map<String, dynamic> json) =
      _$WeatherInfoImpl.fromJson;

  @override
  String get city;
  @override
  double get currentTemp;
  @override
  String get currentSummary;
  @override
  List<DailyWeather> get next7Days;
  @override
  AirQuality get airQuality;
  @override
  String get source;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
