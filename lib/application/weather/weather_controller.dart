import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/application/settings/settings_controller.dart';
import 'package:desktop_tools_flutter/domain/models/weather_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherControllerProvider =
    StateNotifierProvider<WeatherController, AsyncValue<WeatherInfo?>>((ref) {
      return WeatherController(ref);
    });

class WeatherController extends StateNotifier<AsyncValue<WeatherInfo?>> {
  WeatherController(this._ref) : super(const AsyncValue.data(null));

  final Ref _ref;

  Future<void> query(String city) async {
    if (city.trim().isEmpty) return;
    state = const AsyncValue.loading();
    try {
      final data = await _ref.read(weatherRepositoryProvider).fetchByCity(city);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(ErrorMessage.fromException(e), st);
    }
  }

  Future<void> saveDefaultCity() async {
    final weather = state.value;
    if (weather == null) return;
    final settingsRepo = _ref.read(settingsRepositoryProvider);
    final old = await settingsRepo.getSettings();
    await settingsRepo.saveSettings(old.copyWith(weatherCity: weather.city));
    _ref.read(settingsControllerProvider.notifier).load();
  }
}
