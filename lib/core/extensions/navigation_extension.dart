import 'package:finance_app/core/start/navigation/service/i_navigation_service.dart';
import 'package:flutter/material.dart';
import '../start/dependency_injection/dependency_injection_container.dart';
import '../start/navigation/routes/navigation_route.dart';

extension NavigationExtension on BuildContext {
  void navigate(NavigationRoute navigationDetail) {
    INavigationService service = container<INavigationService>();

    service.navigatePath(content: navigationDetail);
  }
}
