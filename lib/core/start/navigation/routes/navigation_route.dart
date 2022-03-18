import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.navigateToHome() = NavigationRouteHome;
  const factory NavigationRoute.navigateToNewsDetail(INews news) =
      NavigationRouteNewsDetail;
}

extension NavigationPathExtension on NavigationRoute {
  String get path {
    // ignore: unnecessary_this
    return this.when<String>(
        navigateToHome: () => "/", navigateToNewsDetail: (_) => "/detail");
  }
}
