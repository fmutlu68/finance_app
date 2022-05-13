import 'package:finance_app/production/constant/enum/graph_time_enum.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';
import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:finance_app/production/features/finance_data/services/currency_graph_data_service.dart';
import 'package:finance_app/production/models/data/history_data_info.dart';
import 'package:flutter/material.dart';

import '../../core/start/network/service/network_manager.dart';
import '../features/finance_data/base/service/i_history_data_service.dart';
import '../features/finance_data/models/res/currency_history.dart';

class HistoryDataProvider extends ChangeNotifier {
  late final Map<HistoryDataInfo, List<IHistoryData>> data;
  late final IHistoryDataService<HistoryInfo, CurrencyHistory>
      _currencyHistoryDataService;

  HistoryDataProvider() {
    data = {};
    _currencyHistoryDataService =
        CurrencyHistoryDataService(manager: NetworkManager.instance);
  }

  Future<List<T>> loadGraphData<T extends IHistoryData<T>>(
      HistoryDataInfo dataInfo) async {
    try {
      if (_checkIfExistHistoryInfo(dataInfo)) {
        return data[_getDataInfo(dataInfo)] as List<T>;
      } else {
        List<IHistoryData> newDataList;
        if (dataInfo.graphTime == GraphTime.daily) {
          newDataList = await _currencyHistoryDataService
              .getDailyGraph(HistoryInfo(name: dataInfo.model.name));
        } else {
          List<DateTime> dates = dataInfo.graphTime.dates;
          newDataList = await _currencyHistoryDataService.getGraphBetweenDate(
              HistoryInfo(name: dataInfo.model.name), dates[0], dates[1]);
        }
        data[dataInfo] = newDataList as List<T>;
        notifyListeners();
        return newDataList;
      }
    } catch (e) {
      print("Catched an error: $e");
      return [];
    }
  }

  List<T> getGraphData<T extends IHistoryData<T>>(HistoryDataInfo dataInfo) {
    return _getDataInfo(dataInfo).model.name == "Empty"
        ? []
        : data[_getDataInfo(dataInfo)]! as List<T>;
  }

  bool _checkIfExistHistoryInfo(HistoryDataInfo dataInfo) =>
      data.keys.any((element) =>
          element.model.name == dataInfo.model.name &&
          element.graphTime == dataInfo.graphTime);

  HistoryDataInfo _getDataInfo(HistoryDataInfo dataInfo) =>
      data.keys.firstWhere(
        (element) =>
            element.model.name == dataInfo.model.name &&
            element.graphTime == dataInfo.graphTime,
        orElse: () => emptyDataInfo,
      );
}
