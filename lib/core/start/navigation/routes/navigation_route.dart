import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.navigateToHome() = NavigationRouteHome;
}

extension NavigationPathExtension on NavigationRoute {
  String get path {
    // return this.when<String>();
    return "";
  }
}
