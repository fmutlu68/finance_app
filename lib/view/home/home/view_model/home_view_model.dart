import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:finance_app/production/utils/ui/custom_page_route.dart';
import 'package:finance_app/view/home/diary/view/diary_view.dart';
import 'package:finance_app/view/home/home/utils/home_view_observer.dart';
import 'package:finance_app/view/home/markets/view/markets_view.dart';
import 'package:finance_app/view/home/news/view/news_view.dart';
import 'package:finance_app/view/home/options/view/options_view.dart';
import 'package:finance_app/view/home/portfolio/view/portfolio_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late final GlobalKey<NavigatorState> navigatorKey;
  late final HomeViewObserver homeViewObserver;
  late final List<Widget> _screen;

  @observable
  int selectedPage = 0;
  @override
  void setContext(BuildContext ctx) => pageContext = ctx;

  @observable
  Route<dynamic>? currentRoute;

  @observable
  bool appCloseable = false;

  @override
  void init() {
    _screen = [];
    homeViewObserver = HomeViewObserver(
      onPop: (r1, r2) {
        setRoute(r2 ?? r1);
      },
      onPush: (p0, p1) {
        setRoute(p0);
      },
    );
    navigatorKey = GlobalKey();
  }

  @override
  void onDispose() {}

  @action
  void setIndex(int newIndex) => selectedPage = newIndex;
  @action
  void setRoute(Route newRoute) => currentRoute = newRoute;
  @action
  void setCloseable(bool close) => appCloseable = close;

  void onPageChanged(int index) {
    setIndex(index);
    switch (index) {
      case 0:
        navigatorKey.currentState!.pushNamed("/");
        break;
      case 1:
        navigatorKey.currentState!.pushNamed("/diary");
        break;
      case 2:
        navigatorKey.currentState!.pushNamed("/news");
        break;
      case 3:
        navigatorKey.currentState!.pushNamed("/portfolio");
        break;
      case 4:
        navigatorKey.currentState!.pushNamed("/options");
        break;
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        _addScreen<MarketsView>(const MarketsView());
        return _buildRoute(
            _screen.firstWhere((element) => element is MarketsView), settings);
      case "/diary":
        _addScreen<DiaryView>(const DiaryView());
        return _buildRoute(
            _screen.firstWhere((element) => element is DiaryView), settings);
      case "/news":
        _addScreen<NewsView>(NewsView());
        return _buildRoute(
            _screen.firstWhere((element) => element is NewsView), settings);
      case "/portfolio":
        _addScreen<PortfolioView>(const PortfolioView());
        return _buildRoute(
            _screen.firstWhere((element) => element is PortfolioView),
            settings);
      case "/options":
        _addScreen<OptionsView>(const OptionsView());
        return _buildRoute(
            _screen.firstWhere((element) => element is OptionsView), settings);
    }
    return null;
  }

  _addScreen<T extends Widget>(T screen) {
    if (!_screen.any((element) => element is T)) {
      _screen.add(screen);
    }
  }

  PageRoute _buildRoute(Widget screen, RouteSettings settings) =>
      CustomPageRoute(builder: (_) => screen, settings: settings);

  void setNewIndexAfterPop() {
    switch (currentRoute!.settings.name) {
      case "/":
        setIndex(0);
        break;
      case "/diary":
        setIndex(1);
        break;
      case "/news":
        setIndex(2);
        break;
      case "/portfolio":
        setIndex(3);
        break;
      case "/options":
        setIndex(4);
        break;
    }
  }
}
