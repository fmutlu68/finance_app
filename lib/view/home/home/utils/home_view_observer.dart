import 'package:flutter/material.dart';

class HomeViewObserver extends RouteObserver {
  final void Function(Route, Route?)? onPop;
  final void Function(Route, Route?)? onPush;
  HomeViewObserver({this.onPop, this.onPush});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (onPop != null) onPop!(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (onPop != null) onPop!(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (onPush != null) onPush!(route, previousRoute);
  }
}
