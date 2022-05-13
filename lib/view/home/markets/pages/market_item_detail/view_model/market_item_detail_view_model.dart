import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:finance_app/core/base/model/base_view_model.dart';

import '../../../../../../production/constant/enum/graph_time_enum.dart';
import '../../../../../../production/models/data/history_data_info.dart';

part 'market_item_detail_view_model.g.dart';

class MarketItemDetailViewModel = _MarketItemDetailViewModelBase
    with _$MarketItemDetailViewModel;

abstract class _MarketItemDetailViewModelBase with Store, BaseViewModel {
  @observable
  HistoryDataInfo<HistoryInfo>? historyInfo;
  late final HistoryInfo _info;
  @override
  void setContext(BuildContext ctx) => context = ctx;

  @override
  void init() {}
  @override
  void onDispose() {}

  @action
  void initHistoryInfo(HistoryInfo model) {
    _info = model;
    historyInfo = HistoryDataInfo<HistoryInfo>(
        model: _info, graphTime: GraphTime.last2Hours);
  }

  @action
  void setDataInfo(GraphTime time) =>
      historyInfo = HistoryDataInfo(model: _info, graphTime: time);
}
