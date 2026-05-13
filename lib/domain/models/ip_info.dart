import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_info.freezed.dart';
part 'ip_info.g.dart';

@freezed
class IpInfo with _$IpInfo {
  const factory IpInfo({
    required String ip,
    required String location,
    required String isp,
    required String riskLevel,
    required DateTime checkedAt,
    required String source,
    String? rawSummary,
  }) = _IpInfo;

  factory IpInfo.fromJson(Map<String, dynamic> json) => _$IpInfoFromJson(json);
}

