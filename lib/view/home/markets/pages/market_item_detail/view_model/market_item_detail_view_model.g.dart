// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_item_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketItemDetailViewModel on _MarketItemDetailViewModelBase, Store {
  late final _$historyInfoAtom = Atom(
      name: '_MarketItemDetailViewModelBase.historyInfo', context: context);

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

  late final _$_MarketItemDetailViewModelBaseActionController =
      ActionController(
          name: '_MarketItemDetailViewModelBase', context: context);

  @override
  void initHistoryInfo<R extends IHistoryData<R>>(
      HistoryInfo model, R parserModel) {
    final _$actionInfo =
        _$_MarketItemDetailViewModelBaseActionController.startAction(
            name:
                '_MarketItemDetailViewModelBase.initHistoryInfo<R extends IHistoryData<R>>');
    try {
      return super.initHistoryInfo<R>(model, parserModel);
    } finally {
      _$_MarketItemDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInfo<R extends IHistoryData<R>>(GraphTime time, R parserModel) {
    final _$actionInfo =
        _$_MarketItemDetailViewModelBaseActionController.startAction(
            name:
                '_MarketItemDetailViewModelBase.setDataInfo<R extends IHistoryData<R>>');
    try {
      return super.setDataInfo<R>(time, parserModel);
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
