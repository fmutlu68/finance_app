import 'package:finance_app/core/start/cache/local_cache_manager.dart';
import 'package:finance_app/core/start/theme/theme_notifier.dart';
import 'package:finance_app/core/start/theme/themes/app_theme_dark.dart';
import 'package:finance_app/core/start/theme/themes/app_theme_light.dart';
import 'package:finance_app/production/features/caching/project_cache_manager.dart';
import 'package:finance_app/production/notifiers/commodity_provider.dart';
import 'package:finance_app/production/notifiers/currency_provider.dart';
import 'package:finance_app/view/home/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/features/local_cache/hive/start/hive_init_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalCacheManager.instance.initCacheService();
  await ProjectCacheManager.init(HiveInitService.instance).initCacheService();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ChangeNotifierProvider(create: (context) => CurrencyProvider()),
      ChangeNotifierProvider(create: (context) => CommodityProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppThemeLight.instance.theme,
      darkTheme: AppThemeDark.instance.theme,
      themeMode: ThemeMode.dark,
      // themeMode: context.watch<ThemeNotifier>().getTheme,
      home: const HomeView(),
    );
  }
}
