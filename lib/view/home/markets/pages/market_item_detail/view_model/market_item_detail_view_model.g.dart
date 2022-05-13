// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_item_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketItemDetailViewModel on _MarketItemDetailViewModelBase, Store {
  final _$historyInfoAtom =
      Atom(name: '_MarketItemDetailViewModelBase.historyInfo');

  @override
  HistoryDataInfo<HistoryInfo>? get historyInfo {
    _$historyInfoAtom.reportRead();
    return super.historyInfo;
  }

  @override
  set historyInfo(HistoryDataInfo<HistoryInfo>? value) {
    _$historyInfoAtom.reportWrite(value, super.historyInfo, () {
      super.historyInfo = value;
    });
  }

  final _$_MarketItemDetailViewModelBaseActionController =
      ActionController(name: '_MarketItemDetailViewModelBase');

  @override
  void initHistoryInfo(HistoryInfo model) {
    final _$actionInfo = _$_MarketItemDetailViewModelBaseActionController
        .startAction(name: '_MarketItemDetailViewModelBase.initHistoryInfo');
    try {
      return super.initHistoryInfo(model);
    } finally {
      _$_MarketItemDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInfo(GraphTime time) {
    final _$actionInfo = _$_MarketItemDetailViewModelBaseActionController
        .startAction(name: '_MarketItemDetailViewModelBase.setDataInfo');
    try {
      return super.setDataInfo(time);
    } finally {
      _$_MarketItemDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historyInfo: ${historyInfo}
    ''';
  }
}
