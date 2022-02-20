import '../navigation/service/i_navigation_service.dart';
import '../navigation/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

final GetIt _injectionContainer = GetIt.instance;
GetIt get container => _injectionContainer;

void setupContainer() {
  _setupAppInit();
  _setupViewmodels();
  _setupServices();
}

void _setupServices() {
  // _injectionContainer
  //     .registerSingleton<BaseColorService>(ColorService()..initService());
}

void _setupAppInit() {
  _injectionContainer
      .registerSingleton<INavigationService>(NavigationService.shared);
}

void _setupViewmodels() {}
