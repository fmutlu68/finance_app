import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_history_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_history.dart';
import 'package:finance_app/production/features/finance_data/services/currency_graph_data_service.dart';

import '../navigation/service/i_navigation_service.dart';
import '../navigation/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

final GetIt _injectionContainer = GetIt.instance;
GetIt get container => _injectionContainer;

void setupContainer() {
  _setupServices();
  _setupAppInit();
  _setupViewmodels();
}

void _setupServices() {
  _injectionContainer
      .registerSingleton<IHistoryDataService<HistoryInfo, CurrencyHistory>>(
          CurrencyHistoryDataService(manager: NetworkManager.instance));
  // _injectionContainer
  //     .registerSingleton<BaseColorService>(ColorService()..initService());
}

void _setupAppInit() {
  _injectionContainer
      .registerSingleton<INavigationService>(NavigationService.shared);
}

void _setupViewmodels() {}
