import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'category_news_list_view_model.g.dart';

class CategoryNewsListViewModel = _CategoryNewsListViewModelBase
    with _$CategoryNewsListViewModel;

abstract class _CategoryNewsListViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext ctx) => context = ctx;

  @override
  void init() {}

  @override
  void onDispose() {}
}
