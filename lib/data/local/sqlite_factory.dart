import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLiteFactory {
  static Future<void> ensureInitialized() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }
}
