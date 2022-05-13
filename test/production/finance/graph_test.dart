import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/constant/enum/graph_time_enum.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_history_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_history.dart';
import 'package:finance_app/production/features/finance_data/services/currency_graph_data_service.dart';
import 'package:finance_app/production/models/data/history_data_info.dart';
import 'package:finance_app/production/notifiers/history_data_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {},
  );
  test(
    "Graph Data Test",
    () async {
      IHistoryDataService<HistoryInfo, CurrencyHistory> service =
          CurrencyHistoryDataService(manager: NetworkManager.instance);
      final result = await service.getDailyGraph(HistoryInfo(name: "USD/TRL"));
      print(result.length);
      final result2 = await service.getDailyGraph(HistoryInfo(name: "EUR/TRL"));
      print(result2.length);
    },
  );
  test(
    "Currency Graph Data Provider Test",
    () async {
      HistoryDataProvider historyDataProvider = HistoryDataProvider();
      final response = historyDataProvider.getGraphData<CurrencyHistory>(
          HistoryDataInfo<HistoryInfo>(
              model: HistoryInfo(name: "USD/TRL"), graphTime: GraphTime.daily));
      print(response.length);
    },
  );
  test(
    "Currency Graph Data Between Dates Service Test",
    () async {
      IHistoryDataService<HistoryInfo, CurrencyHistory> service =
          CurrencyHistoryDataService(manager: NetworkManager.instance);
      final response = await service.getGraphBetweenDate(
          HistoryInfo(name: "USD/TRL"),
          DateTime(2021, 5, 5),
          DateTime(2022, 5, 5));
      print(response.first.date.toString());
    },
  );

  test(
    "Currency Graph Data Between Dates Provider Test",
    () async {
      HistoryDataProvider historyDataProvider = HistoryDataProvider();
      final response = await historyDataProvider.loadGraphData<CurrencyHistory>(
          HistoryDataInfo<HistoryInfo>(
              model: HistoryInfo(name: "USD/TRL"), graphTime: GraphTime.year));
      print(response.first.date);
    },
  );
}
