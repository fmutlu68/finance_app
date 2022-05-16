import 'package:flutter/material.dart';

import '../../start/navigation/service/i_navigation_service.dart';
import '../../start/navigation/service/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? pageContext;
  void setContext(BuildContext newContext);
  void init();
  void onDispose();

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(pageContext!);
  INavigationService navigationService = NavigationService.shared;

  // ILocalCacheManager cacheManager = LocalCacheManager.instance;
}
