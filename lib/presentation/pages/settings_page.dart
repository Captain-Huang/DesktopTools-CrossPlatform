import 'dart:io';

import 'package:desktop_tools_flutter/application/settings/settings_controller.dart';
import 'package:desktop_tools_flutter/domain/models/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _focusCtrl = TextEditingController();
  final _shortCtrl = TextEditingController();
  final _longCtrl = TextEditingController();
  final _everyCtrl = TextEditingController();
  final _todoReminderCtrl = TextEditingController();
  final _weatherCtrl = TextEditingController();
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(settingsControllerProvider);

    settingsAsync.whenData((s) {
      if (!_initialized) {
        _focusCtrl.text = '${s.focusMinutes}';
        _shortCtrl.text = '${s.shortBreakMinutes}';
        _longCtrl.text = '${s.longBreakMinutes}';
        _everyCtrl.text = '${s.longBreakEvery}';
        _todoReminderCtrl.text = '${s.todoReminderMinutes}';
        _weatherCtrl.text = s.weatherCity;
        _initialized = true;
      }
    });

    return settingsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (settings) {
        return ListView(
          children: [
            _fieldWithBoldTitle('专注时长（分钟）', _focusCtrl),
            _fieldWithBoldTitle('短休时长（分钟）', _shortCtrl),
            _fieldWithBoldTitle('长休时长（分钟）', _longCtrl),
            _fieldWithBoldTitle('每 N 次专注后长休', _everyCtrl),
            _fieldWithBoldTitle('待办提醒提前（分钟）', _todoReminderCtrl),
            _fieldWithBoldTitle('默认天气城市', _weatherCtrl, isText: true),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final next = AppSettings(
                  focusMinutes: int.tryParse(_focusCtrl.text) ?? settings.focusMinutes,
                  shortBreakMinutes: int.tryParse(_shortCtrl.text) ?? settings.shortBreakMinutes,
                  longBreakMinutes: int.tryParse(_longCtrl.text) ?? settings.longBreakMinutes,
                  longBreakEvery: int.tryParse(_everyCtrl.text) ?? settings.longBreakEvery,
                  todoReminderMinutes:
                      int.tryParse(_todoReminderCtrl.text) ?? settings.todoReminderMinutes,
                  weatherCity:
                      _weatherCtrl.text.trim().isEmpty ? settings.weatherCity : _weatherCtrl.text.trim(),
                );
                await ref.read(settingsControllerProvider.notifier).save(next);
                if (!mounted) return;
                messenger.showSnackBar(const SnackBar(content: Text('设置已保存')));
              },
              child: const Text('保存设置'),
            ),
            const SizedBox(height: 20),
            if (Platform.isWindows)
              const ListTile(
                title: Text('Windows 托盘最小化'),
                subtitle: Text('当前为能力占位，可后续接入系统托盘插件实现关闭到托盘。'),
              ),
            if (Platform.isAndroid)
              const ListTile(
                title: Text('Android 后台行为'),
                subtitle: Text('通知通道已初始化，番茄与待办提醒支持本地通知。'),
              ),
          ],
        );
      },
    );
  }

  Widget _fieldWithBoldTitle(
    String title,
    TextEditingController controller, {
    bool isText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF203554),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: isText ? TextInputType.text : TextInputType.number,
            decoration: const InputDecoration(
              isDense: true,
              hintText: '请输入',
            ),
          ),
        ],
      ),
    );
  }
}
