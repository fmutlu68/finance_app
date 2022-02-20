import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'i_navigation_router.dart';

class NavigationRouter extends INavigationRouter {
  static NavigationRouter? _instance;
  static NavigationRouter get instance {
    _instance ??= NavigationRouter._init();
    return _instance!;
  }

  NavigationRouter._init();

  @override
  Route generateRoute(RouteSettings settings) {
    // if (settings.arguments == null) {
    //   bool? wasOnboardScreenShowed = LocalCacheManager.instance
    //       .get<bool>(PreferencesKeys.ONBOARD_SCREEN_SHOWED.key);
    //   if (wasOnboardScreenShowed == true) {
    //     return generatePageRoute(LoginView());
    //   }
    //   return generatePageRoute(OnboardView());
    // }
    // NavigationRoute content = settings.arguments as NavigationRoute;

    // return content.when(
    //   navigateToOnboard: () => generatePageRoute(OnboardView()),
    //   navigateToMainLogin: () => generatePageRoute(MainLoginView()),
    //   navigateToFruitDetail: (Fruit fruit) =>
    //       generatePageRoute(FruitDetailView(fruit: fruit)),
    //   navigateToHome: () => generatePageRoute(FruitsView()),
    //   navigateToShoppingCart: () => generatePageRoute(CartView()),
    //   navigateToFavorites: () => generatePageRoute(FavoritesView()),
    //   navigateToAccount: () => generatePageRoute(AccountView()),
    //   navigateToLogin: () => generatePageRoute(LoginView()),
    // );
    return generatePageRoute(const Scaffold());
  }

  @override
  CupertinoPageRoute generatePageRoute(Widget screen) {
    return CupertinoPageRoute(builder: (_) => screen);
  }
}
