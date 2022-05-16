import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'markets_view_model.g.dart';

class MarketsViewModel = _MarketsViewModelBase with _$MarketsViewModel;

abstract class _MarketsViewModelBase with Store, BaseViewModel {
  late final TabController marketsTabController;
  void initTabController(TickerProvider provider) {
    marketsTabController = TabController(length: 4, vsync: provider);
  }

  @override
  void onDispose() {}

  @override
  void setContext(BuildContext ctx) => pageContext = ctx;

  @override
  void init() {}
}
