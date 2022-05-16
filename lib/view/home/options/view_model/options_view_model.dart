import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'options_view_model.g.dart';

class OptionsViewModel = _OptionsViewModelBase with _$OptionsViewModel;

abstract class _OptionsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext ctx) => pageContext = ctx;

  @override
  void init() {}

  @override
  void onDispose() {}
}
