import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'news_view_model.g.dart';

class NewsViewModel = _NewsViewModelBase with _$NewsViewModel;

abstract class _NewsViewModelBase with Store, BaseViewModel {
  late PageController controller;
  @observable
  int headlineIndex = 0;
  @override
  void setContext(BuildContext ctx) => pageContext = ctx;

  @override
  void init() {
    controller = PageController();
  }

  @override
  void onDispose() {
    controller.dispose();
  }

  @action
  void updateIndex(int newIndex) => headlineIndex = newIndex;
}
