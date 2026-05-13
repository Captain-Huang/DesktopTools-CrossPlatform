import 'package:desktop_tools_flutter/application/ip/ip_lookup_controller.dart';
import 'package:desktop_tools_flutter/core/error/app_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class IpPage extends ConsumerStatefulWidget {
  const IpPage({super.key});

  @override
  ConsumerState<IpPage> createState() => _IpPageState();
}

class _IpPageState extends ConsumerState<IpPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() {
      final state = ref.read(ipLookupControllerProvider);
      if (state.value == null && !state.isLoading) {
        ref.read(ipLookupControllerProvider.notifier).query();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ipLookupControllerProvider);
    final controller = ref.read(ipLookupControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilledButton.icon(
          onPressed: controller.query,
          icon: const Icon(Icons.search),
          label: const Text('查询当前公网信息'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => _ErrorView(error: e),
            data: (info) {
              if (info == null) return const Text('点击上方按钮开始查询');
              final detail = [
                'IP: ${info.ip}',
                '归属地: ${info.location}',
                'ISP: ${info.isp}',
                '风险: ${info.riskLevel}',
                '检测时间: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(info.checkedAt)}',
                '数据源: ${info.source}',
              ].join('\n');

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IP: ${info.ip}', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text('归属地: ${info.location}'),
                      Text('ISP: ${info.isp}'),
                      Text('风险: ${info.riskLevel}'),
                      Text('检测时间: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(info.checkedAt)}'),
                      Text('数据源: ${info.source}'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () => Clipboard.setData(ClipboardData(text: info.ip)),
                            icon: const Icon(Icons.copy),
                            label: const Text('复制 IP'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => Clipboard.setData(ClipboardData(text: detail)),
                            icon: const Icon(Icons.content_copy),
                            label: const Text('复制完整信息'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final message = error is AppError ? (error as AppError).message : '查询失败，请稍后重试';
    return Center(child: Text(message));
  }
}

