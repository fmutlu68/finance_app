import 'package:finance_app/core/extensions/theme_mode_extension.dart';
import 'package:finance_app/core/start/cache/local_cache_manager.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _mode = _getInitialThemeMode();

  /// The Member... hatası static sayesinde çözüldü.
  static ThemeMode _getInitialThemeMode() =>
      LocalCacheManager.instance.get<String>("theme") == ThemeMode.dark.theme
          ? ThemeMode.dark
          : ThemeMode.light;

  void changeTheme() {
    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
    LocalCacheManager.instance.setString("theme", _mode.theme);
    notifyListeners();
  }

  ThemeMode get getTheme => _mode;
}
