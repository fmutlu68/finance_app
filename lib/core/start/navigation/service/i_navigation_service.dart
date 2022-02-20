import '../routes/navigation_route.dart';

abstract class INavigationService {
  Future<T?> navigatePath<T>({required NavigationRoute content});
  void popByParam<T>({T? data});
  void popWidget();
}
