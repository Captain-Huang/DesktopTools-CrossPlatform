import 'package:desktop_tools_flutter/core/error/app_error.dart';
import 'package:desktop_tools_flutter/domain/models/ip_info.dart';
import 'package:dio/dio.dart';

class IpRepository {
  IpRepository(this._dio);

  final Dio _dio;

  Future<IpInfo> fetchIpInfo() async {
    try {
      return await _fetchPrimary();
    } catch (_) {
      return _fetchBackup();
    }
  }

  Future<IpInfo> _fetchPrimary() async {
    final response = await _dio.get<Map<String, dynamic>>(
      'http://ip-api.com/json',
      queryParameters: {
        'fields': 'status,message,query,country,regionName,city,isp,proxy,hosting,mobile',
      },
    );
    final data = response.data;
    if (data == null || data['status'] != 'success') {
      throw const AppError(type: AppErrorType.network, message: '主接口查询失败');
    }

    final risk = ((data['proxy'] == true) ||
            (data['hosting'] == true) ||
            (data['mobile'] == true))
        ? '中高风险'
        : '低风险';

    return IpInfo(
      ip: '${data['query'] ?? ''}',
      location:
          '${data['country'] ?? ''} ${data['regionName'] ?? ''} ${data['city'] ?? ''}'
              .trim(),
      isp: '${data['isp'] ?? ''}',
      riskLevel: risk,
      checkedAt: DateTime.now(),
      source: 'ip-api',
      rawSummary: data.toString(),
    );
  }

  Future<IpInfo> _fetchBackup() async {
    final response = await _dio.get<Map<String, dynamic>>('https://ipwho.is/');
    final data = response.data;
    if (data == null || data['success'] == false) {
      throw const AppError(type: AppErrorType.network, message: '备接口查询失败');
    }

    final security = data['security'] as Map<String, dynamic>?;
    final proxyFlag = security?['proxy'] == true ||
        security?['vpn'] == true ||
        security?['tor'] == true;

    return IpInfo(
      ip: '${data['ip'] ?? ''}',
      location:
          '${data['country'] ?? ''} ${data['region'] ?? ''} ${data['city'] ?? ''}'
              .trim(),
      isp: '${(data['connection'] as Map<String, dynamic>?)?['isp'] ?? ''}',
      riskLevel: proxyFlag ? '中高风险' : '低风险',
      checkedAt: DateTime.now(),
      source: 'ipwho.is',
      rawSummary: data.toString(),
    );
  }
}

