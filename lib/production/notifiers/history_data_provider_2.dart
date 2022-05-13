import 'package:finance_app/production/constant/enum/graph_time_enum.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';
import 'package:finance_app/production/models/data/history_data_info.dart';
import 'package:flutter/material.dart';

import '../../core/start/network/service/network_manager.dart';
import '../features/finance_data/base/service/i_history_data_service.dart';
import '../features/finance_data/models/req/history_info.dart';
import '../features/finance_data/services/graph_data_service.dart';

class HistoryDataProvider extends ChangeNotifier {
  late final Map<HistoryDataInfo, List<IHistoryData>> data;
  late final IHistoryDataService2 _historyDataService;

  HistoryDataProvider() {
    data = {};
    _historyDataService = HistoryDataService(manager: NetworkManager.instance);
  }

  Future<List<R>> loadGraphData<R extends IHistoryData<R>>(
      HistoryDataInfo<HistoryInfo> dataInfo, R parserModel) async {
    try {
      if (_checkIfExistHistoryInfo(dataInfo)) {
        return data[_getDataInfo(dataInfo)] as List<R>;
      } else {
        List<IHistoryData> newDataList;
        if (dataInfo.graphTime == GraphTime.last2Hours) {
          newDataList = await _historyDataService
              .getLast2HoursGraph<HistoryInfo, R>(dataInfo.model, parserModel);
        } else if (dataInfo.graphTime == GraphTime.daily) {
          newDataList = await _historyDataService.getDailyGraph<HistoryInfo, R>(
              dataInfo.model, parserModel);
        } else {
          List<DateTime> dates = dataInfo.graphTime.dates;
          newDataList =
              await _historyDataService.getGraphBetweenDate<HistoryInfo, R>(
                  dataInfo.model, parserModel, dates[0], dates[1]);
        }
        data[dataInfo] = newDataList as List<R>;
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
