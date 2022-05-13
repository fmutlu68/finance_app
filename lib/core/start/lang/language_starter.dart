import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LanguageStarter {
  static LanguageStarter? _instance;
  static LanguageStarter get instance {
    _instance ??= LanguageStarter._init();
    return _instance!;
  }

  LanguageStarter._init();

  final trLocale = const Locale("tr", "TR");
  final enLocale = const Locale("en", "US");

  List<Locale> get supportedLocales => [trLocale, enLocale];
  List<LocalizationsDelegate> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
}
