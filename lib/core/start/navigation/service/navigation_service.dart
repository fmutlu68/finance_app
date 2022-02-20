import 'package:flutter/material.dart';
import '../routes/navigation_route.dart';
import 'i_navigation_service.dart';

class NavigationService extends INavigationService {
  static final NavigationService shared = NavigationService._init();

  NavigationService._init();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey();
  @override
  Future<T?> navigatePath<T>({required NavigationRoute content}) async {
    if (navigationKey.currentState == null) {
      return null;
    } else {
      return await navigationKey.currentState!
          .pushNamed<T>(content.path, arguments: content);
    }
  }

  @override
  void popByParam<T>({T? data}) {
    navigationKey.currentState!.pop<T>(data);
  }

  @override
  void popWidget() {
    navigationKey.currentState!.pop();
  }
}
