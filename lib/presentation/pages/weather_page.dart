import 'package:desktop_tools_flutter/application/settings/settings_controller.dart';
import 'package:desktop_tools_flutter/application/weather/weather_controller.dart';
import 'package:desktop_tools_flutter/core/error/app_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({super.key});

  @override
  ConsumerState<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<WeatherPage> {
  late final TextEditingController _cityCtrl;
  bool _autoQueried = false;

  @override
  void initState() {
    super.initState();
    _cityCtrl = TextEditingController(text: '北京');
    Future<void>.microtask(() async {
      final settings = ref.read(settingsControllerProvider).value;
      if (settings != null) {
        _cityCtrl.text = settings.weatherCity;
      } else {
        await ref.read(settingsControllerProvider.notifier).load();
        final loaded = ref.read(settingsControllerProvider).value;
        if (loaded != null && mounted) {
          _cityCtrl.text = loaded.weatherCity;
        }
      }
      await _tryAutoQuery();
    });
  }

  Future<void> _tryAutoQuery() async {
    if (_autoQueried) return;
    final city = _cityCtrl.text.trim();
    if (city.isEmpty) return;
    final weatherState = ref.read(weatherControllerProvider);
    if (weatherState.value != null || weatherState.isLoading) return;
    _autoQueried = true;
    await ref.read(weatherControllerProvider.notifier).query(city);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weatherControllerProvider);
    final controller = ref.read(weatherControllerProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _cityCtrl,
                decoration: const InputDecoration(labelText: '输入城市'),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () => controller.query(_cityCtrl.text.trim()),
              child: const Text('查询'),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: controller.saveDefaultCity,
              child: const Text('保存为默认城市'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) {
              final msg = e is AppError ? e.message : '天气查询失败';
              return Center(child: Text(msg));
            },
            data: (weather) {
              if (weather == null) {
                return const Center(child: Text('请输入城市后查询天气'));
              }
              return ListView.separated(
                itemCount: weather.next7Days.length + 1,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(weather.city, style: Theme.of(context).textTheme.titleLarge),
                            Text('当前: ${weather.currentTemp}°C ${weather.currentSummary}'),
                            Text(
                              '空气质量: AQI ${weather.airQuality.aqi ?? '-'} / PM2.5 ${weather.airQuality.pm25?.toStringAsFixed(1) ?? '-'} / PM10 ${weather.airQuality.pm10?.toStringAsFixed(1) ?? '-'}',
                            ),
                            Text('数据源: ${weather.source}'),
                          ],
                        ),
                      ),
                    );
                  }

                  final day = weather.next7Days[index - 1];
                  return Card(
                    child: Container(
                      height: 64,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(width: 84, child: Text(DateFormat('MM-dd').format(day.date))),
                          Expanded(
                            child: Text(
                              day.summary,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text('${day.minTemp} ~ ${day.maxTemp}°C'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

