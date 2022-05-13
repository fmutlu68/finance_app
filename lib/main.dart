import 'package:easy_localization/easy_localization.dart';
import 'package:finance_app/core/start/cache/local_cache_manager.dart';
import 'package:finance_app/core/start/dependency_injection/dependency_injection_container.dart';
import 'package:finance_app/core/start/lang/language_starter.dart';
import 'package:finance_app/core/start/navigation/router/navigation_router.dart';
import 'package:finance_app/core/start/navigation/service/navigation_service.dart';
import 'package:finance_app/core/start/theme/theme_notifier.dart';
import 'package:finance_app/core/start/theme/themes/app_theme_dark.dart';
import 'package:finance_app/core/start/theme/themes/app_theme_light.dart';
import 'package:finance_app/production/constant/app_constants.dart';
import 'package:finance_app/production/features/caching/project_cache_manager.dart';
import 'package:finance_app/production/notifiers/commodity_provider.dart';
import 'package:finance_app/production/notifiers/crypto_provider.dart';
import 'package:finance_app/production/notifiers/currency_provider.dart';
import 'package:finance_app/production/notifiers/economic_calendar_provider.dart';
import 'package:finance_app/production/notifiers/history_data_provider_2.dart';
import 'package:finance_app/production/notifiers/news_provider.dart';
import 'package:finance_app/production/notifiers/parity_provider.dart';
import 'package:finance_app/view/home/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/features/local_cache/hive/start/hive_init_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalCacheManager.instance.initCacheService();
  await ProjectCacheManager.init(HiveInitService.instance).initCacheService();
  setupContainer();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageStarter.instance.supportedLocales,
      path: AppConstants.LANG_ASSET_PATH,
      useOnlyLangCode: false,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeNotifier()),
          ChangeNotifierProvider(create: (context) => CurrencyProvider()),
          ChangeNotifierProvider(create: (context) => CommodityProvider()),
          ChangeNotifierProvider(create: (context) => ParityProvider()),
          ChangeNotifierProvider(create: (context) => CryptoProvider()),
          ChangeNotifierProvider(create: (context) => NewsProvider()),
          ChangeNotifierProvider(create: (context) => HistoryDataProvider()),
          ChangeNotifierProvider(
              create: (context) => EconomicCalendarProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.shared.navigationKey,
      onGenerateRoute: NavigationRouter.instance.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppThemeLight.instance.theme,
      darkTheme: AppThemeDark.instance.theme,
      themeMode: context.watch<ThemeNotifier>().getTheme,
      home: const HomeView(),
      locale: context.locale,
      supportedLocales: LanguageStarter.instance.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
