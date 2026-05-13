// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpInfoImpl _$$IpInfoImplFromJson(Map<String, dynamic> json) => _$IpInfoImpl(
  ip: json['ip'] as String,
  location: json['location'] as String,
  isp: json['isp'] as String,
  riskLevel: json['riskLevel'] as String,
  checkedAt: DateTime.parse(json['checkedAt'] as String),
  source: json['source'] as String,
  rawSummary: json['rawSummary'] as String?,
);

Map<String, dynamic> _$$IpInfoImplToJson(_$IpInfoImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'location': instance.location,
      'isp': instance.isp,
      'riskLevel': instance.riskLevel,
      'checkedAt': instance.checkedAt.toIso8601String(),
      'source': instance.source,
      'rawSummary': instance.rawSummary,
    };
