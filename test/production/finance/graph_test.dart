import 'package:finance_app/production/constant/enum/graph_time_enum.dart';
import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/history/commodity_history.dart';
import 'package:finance_app/production/features/finance_data/models/res/history/currency_history.dart';
import 'package:finance_app/production/models/data/history_data_info.dart';
import 'package:finance_app/production/notifiers/history_data_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {},
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
    "Currency Graph Data Between Dates Provider Test",
    () async {
      HistoryDataProvider historyDataProvider = HistoryDataProvider();
      final response = await historyDataProvider.loadGraphData<CurrencyHistory>(
          HistoryDataInfo<HistoryInfo>(
              model: HistoryInfo(name: "USD/TRL"), graphTime: GraphTime.year),
          CurrencyHistory());
      print(response.first.date);
    },
  );

  test(
    "Commodity Graph Data Between Dates Provider Test",
    () async {
      HistoryDataProvider provider = HistoryDataProvider();
      final response = await provider.loadGraphData<CommodityHistory>(
          HistoryDataInfo<HistoryInfo>(
              model: HistoryInfo(name: "SGCEYREK"),
              graphTime: GraphTime.last2Hours),
          CommodityHistory());
      print(response.first.date.toString());
      print(response.last.date.toString());
      print(response.length);
    },
  );
}
