// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ip_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IpInfo _$IpInfoFromJson(Map<String, dynamic> json) {
  return _IpInfo.fromJson(json);
}

/// @nodoc
mixin _$IpInfo {
  String get ip => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get isp => throw _privateConstructorUsedError;
  String get riskLevel => throw _privateConstructorUsedError;
  DateTime get checkedAt => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String? get rawSummary => throw _privateConstructorUsedError;

  /// Serializes this IpInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IpInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IpInfoCopyWith<IpInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpInfoCopyWith<$Res> {
  factory $IpInfoCopyWith(IpInfo value, $Res Function(IpInfo) then) =
      _$IpInfoCopyWithImpl<$Res, IpInfo>;
  @useResult
  $Res call({
    String ip,
    String location,
    String isp,
    String riskLevel,
    DateTime checkedAt,
    String source,
    String? rawSummary,
  });
}

/// @nodoc
class _$IpInfoCopyWithImpl<$Res, $Val extends IpInfo>
    implements $IpInfoCopyWith<$Res> {
  _$IpInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IpInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? location = null,
    Object? isp = null,
    Object? riskLevel = null,
    Object? checkedAt = null,
    Object? source = null,
    Object? rawSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            ip: null == ip
                ? _value.ip
                : ip // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            isp: null == isp
                ? _value.isp
                : isp // ignore: cast_nullable_to_non_nullable
                      as String,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            checkedAt: null == checkedAt
                ? _value.checkedAt
                : checkedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            rawSummary: freezed == rawSummary
                ? _value.rawSummary
                : rawSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IpInfoImplCopyWith<$Res> implements $IpInfoCopyWith<$Res> {
  factory _$$IpInfoImplCopyWith(
    _$IpInfoImpl value,
    $Res Function(_$IpInfoImpl) then,
  ) = __$$IpInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String ip,
    String location,
    String isp,
    String riskLevel,
    DateTime checkedAt,
    String source,
    String? rawSummary,
  });
}

/// @nodoc
class __$$IpInfoImplCopyWithImpl<$Res>
    extends _$IpInfoCopyWithImpl<$Res, _$IpInfoImpl>
    implements _$$IpInfoImplCopyWith<$Res> {
  __$$IpInfoImplCopyWithImpl(
    _$IpInfoImpl _value,
    $Res Function(_$IpInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IpInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? location = null,
    Object? isp = null,
    Object? riskLevel = null,
    Object? checkedAt = null,
    Object? source = null,
    Object? rawSummary = freezed,
  }) {
    return _then(
      _$IpInfoImpl(
        ip: null == ip
            ? _value.ip
            : ip // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        isp: null == isp
            ? _value.isp
            : isp // ignore: cast_nullable_to_non_nullable
                  as String,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        checkedAt: null == checkedAt
            ? _value.checkedAt
            : checkedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        rawSummary: freezed == rawSummary
            ? _value.rawSummary
            : rawSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IpInfoImpl implements _IpInfo {
  const _$IpInfoImpl({
    required this.ip,
    required this.location,
    required this.isp,
    required this.riskLevel,
    required this.checkedAt,
    required this.source,
    this.rawSummary,
  });

  factory _$IpInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$IpInfoImplFromJson(json);

  @override
  final String ip;
  @override
  final String location;
  @override
  final String isp;
  @override
  final String riskLevel;
  @override
  final DateTime checkedAt;
  @override
  final String source;
  @override
  final String? rawSummary;

  @override
  String toString() {
    return 'IpInfo(ip: $ip, location: $location, isp: $isp, riskLevel: $riskLevel, checkedAt: $checkedAt, source: $source, rawSummary: $rawSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpInfoImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isp, isp) || other.isp == isp) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.checkedAt, checkedAt) ||
                other.checkedAt == checkedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.rawSummary, rawSummary) ||
                other.rawSummary == rawSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ip,
    location,
    isp,
    riskLevel,
    checkedAt,
    source,
    rawSummary,
  );

  /// Create a copy of IpInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IpInfoImplCopyWith<_$IpInfoImpl> get copyWith =>
      __$$IpInfoImplCopyWithImpl<_$IpInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IpInfoImplToJson(this);
  }
}

abstract class _IpInfo implements IpInfo {
  const factory _IpInfo({
    required final String ip,
    required final String location,
    required final String isp,
    required final String riskLevel,
    required final DateTime checkedAt,
    required final String source,
    final String? rawSummary,
  }) = _$IpInfoImpl;

  factory _IpInfo.fromJson(Map<String, dynamic> json) = _$IpInfoImpl.fromJson;

  @override
  String get ip;
  @override
  String get location;
  @override
  String get isp;
  @override
  String get riskLevel;
  @override
  DateTime get checkedAt;
  @override
  String get source;
  @override
  String? get rawSummary;

  /// Create a copy of IpInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IpInfoImplCopyWith<_$IpInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
