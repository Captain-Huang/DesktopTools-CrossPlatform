import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/domain/models/app_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, AsyncValue<AppSettings>>((ref) {
      return SettingsController(ref)..load();
    });

class SettingsController extends StateNotifier<AsyncValue<AppSettings>> {
  SettingsController(this._ref) : super(const AsyncValue.loading());

  final Ref _ref;

  Future<void> load() async {
    try {
      final settings = await _ref.read(settingsRepositoryProvider).getSettings();
      state = AsyncValue.data(settings);
    } catch (e, st) {
      state = AsyncValue.error(ErrorMessage.fromException(e), st);
    }
  }

  Future<void> save(AppSettings settings) async {
    try {
      await _ref.read(settingsRepositoryProvider).saveSettings(settings);
      state = AsyncValue.data(settings);
    } catch (e, st) {
      state = AsyncValue.error(ErrorMessage.fromException(e), st);
    }
  }
}

