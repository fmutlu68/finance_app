import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/widgets.dart';

abstract class INavigationRouter {
  Route<dynamic> generateRoute(RouteSettings settings);
  CupertinoPageRoute generatePageRoute(Widget screen);
}
