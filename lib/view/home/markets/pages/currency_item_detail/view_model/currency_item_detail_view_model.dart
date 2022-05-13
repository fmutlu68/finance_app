// import 'package:finance_app/core/base/model/base_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';

// import '../../../../../../production/models/data/history_data_info.dart';
// part 'currency_item_detail_view_model.g.dart';

// class CurrencyItemDetailViewModel = CurrencyItemDetailViewModelBase
//     with _$CurrencyItemDetailViewModel;

// abstract class CurrencyItemDetailViewModelBase with Store, BaseViewModel {
//   @observable
//   HistoryDataInfo? historyInfo;
//   @override
//   void setContext(BuildContext newContext) => context = newContext;

//   @override
//   void init() {}
//   @override
//   void onDispose() {}

//   void initHistoryInfo(String symbol) {
//     // historyInfo = HistoryDataInfo(symbol: symbol, graphTime: GraphTime.daily);
//   }

//   @action
//   void setDataInfo(HistoryDataInfo dataInfo) => historyInfo = dataInfo;
// }
