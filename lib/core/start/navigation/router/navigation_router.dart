import 'package:finance_app/core/start/navigation/routes/navigation_route.dart';
import 'package:finance_app/view/home/home/view/home_view.dart';
import 'package:finance_app/view/home/news/pages/news_content_detail/view/news_content_detail.dart';
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
    NavigationRoute content = settings.arguments as NavigationRoute;

    return content.when<Route>(
      navigateToHome: () => generatePageRoute(const HomeView()),
      navigateToNewsDetail: (news) =>
          generatePageRoute(NewsContentDetail(news: news)),
    );
  }

  @override
  CupertinoPageRoute generatePageRoute(Widget screen) {
    return CupertinoPageRoute(builder: (_) => screen);
  }
}
