import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:desktop_tools_flutter/core/providers.dart';
import 'package:desktop_tools_flutter/domain/models/ip_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ipLookupControllerProvider =
    StateNotifierProvider<IpLookupController, AsyncValue<IpInfo?>>((ref) {
      return IpLookupController(ref);
    });

class IpLookupController extends StateNotifier<AsyncValue<IpInfo?>> {
  IpLookupController(this._ref) : super(const AsyncValue.data(null));

  final Ref _ref;

  Future<void> query() async {
    state = const AsyncValue.loading();
    try {
      final data = await _ref.read(ipRepositoryProvider).fetchIpInfo();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(ErrorMessage.fromException(e), st);
    }
  }
}

