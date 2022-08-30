import 'package:finance_app/production/features/finance_data/base/model/response_model.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../../base/model/i_history_data.dart';

part 'currency_history.g.dart';

@JsonSerializable()
class CurrencyHistory extends IHistoryData<CurrencyHistory>
    implements ResponseModel {
  double? high;
  double? low;
  double? open;

  CurrencyHistory(
      {DateTime? date, double? close, this.high, this.low, this.open})
      : super(date, close);

  factory CurrencyHistory.fromJson(Map<String, dynamic> json) =>
      _$CurrencyHistoryFromJson(json);

  @override
  Map<String, dynamic> get toJson => _$CurrencyHistoryToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => CurrencyHistory.fromJson(json);
}
