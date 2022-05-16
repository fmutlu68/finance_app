import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:finance_app/production/notifiers/history_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../production/constant/enum/graph_time_enum.dart';
import '../../../../../../production/features/finance_data/base/model/i_history_data.dart';
import '../../../../../../production/models/data/history_data_info.dart';

part 'market_item_detail_view_model.g.dart';

class MarketItemDetailViewModel = _MarketItemDetailViewModelBase
    with _$MarketItemDetailViewModel;

abstract class _MarketItemDetailViewModelBase with Store, BaseViewModel {
  @observable
  HistoryDataInfo<HistoryInfo>? historyInfo;
  late final HistoryInfo _info;
  @override
  void setContext(BuildContext ctx) => pageContext = ctx;

  @override
  void init() {}
  @override
  void onDispose() {}

  @action
  void initHistoryInfo<R extends IHistoryData<R>>(
      HistoryInfo model, R parserModel) {
    _info = model;
    historyInfo = HistoryDataInfo<HistoryInfo>(
        model: _info, graphTime: GraphTime.last2Hours);
    loadGraphData(parserModel);
  }

  @action
  void setDataInfo<R extends IHistoryData<R>>(GraphTime time, R parserModel) {
    historyInfo = HistoryDataInfo(model: _info, graphTime: time);
    loadGraphData(parserModel);
  }

  void loadGraphData<R extends IHistoryData<R>>(R parserModel) {
    pageContext!
        .read<HistoryDataProvider>()
        .loadGraphData<R>(historyInfo!, parserModel);
  }
}
