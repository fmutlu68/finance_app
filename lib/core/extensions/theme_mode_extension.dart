import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get theme {
    switch (this) {
      case ThemeMode.dark:
        return "DARK";
      case ThemeMode.light:
        return "LIGHT";
      default:
        return "LIGHT";
    }
  }
}
