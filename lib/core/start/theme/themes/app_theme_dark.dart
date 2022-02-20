import 'package:finance_app/core/start/theme/themes/app_theme.dart';
import 'package:finance_app/production/utils/ui/custom_page_route.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: _color,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        backgroundColor: Colors.black,
      ),
      bottomAppBarColor: Colors.white10,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomTransitionsBuilder(),
        },
      ));

  ColorScheme get _color => const ColorScheme.dark().copyWith();
}
