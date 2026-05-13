import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    const colorSeed = Color(0xFF1E7A73);
    final scheme = ColorScheme.fromSeed(seedColor: colorSeed);
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: const CardThemeData(margin: EdgeInsets.zero),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
