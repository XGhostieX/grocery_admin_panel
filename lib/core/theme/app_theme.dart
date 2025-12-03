import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../utils/service_locator.dart';

enum ThemeMode { light, dark }

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode mode;
  final Ref ref;

  ThemeNotifier({this.mode = ThemeMode.dark, required this.ref}) : super(darkTheme) {
    getTheme();
  }

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light().copyWith(secondary: const Color(0xFFE9FCFC)),
    cardColor: const Color(0xFFF2FDFD),
    canvasColor: Colors.grey[50],
    buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF00001a),
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.dark().copyWith(secondary: const Color(0xFF1a1f3c)),
    cardColor: const Color(0xFF0a0d2c),
    canvasColor: Colors.black,
    buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.dark()),
  );

  void getTheme() async {
    final prefs = await ref.read(sharedPreferencesProvider);
    final theme = prefs.getString('theme');
    if (theme == 'light') {
      mode = ThemeMode.light;
      state = lightTheme;
    } else {
      mode = ThemeMode.dark;
      state = darkTheme;
    }
  }

  void toggleTheme() async {
    final prefs = await ref.read(sharedPreferencesProvider);
    if (mode == ThemeMode.dark) {
      mode = ThemeMode.light;
      state = lightTheme;
      prefs.setString('theme', 'light');
    } else {
      mode = ThemeMode.dark;
      state = darkTheme;
      prefs.setString('theme', 'dark');
    }
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(ref: ref),
);
