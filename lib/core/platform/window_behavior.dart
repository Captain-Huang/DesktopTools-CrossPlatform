import 'dart:io';

abstract class WindowBehavior {
  Future<void> enableCloseToTrayPlaceholder();
}

class WindowBehaviorImpl implements WindowBehavior {
  @override
  Future<void> enableCloseToTrayPlaceholder() async {
    if (Platform.isWindows) {
      // Placeholder for tray integration, e.g. with bitsdojo_window/system_tray.
      return;
    }
  }
}

