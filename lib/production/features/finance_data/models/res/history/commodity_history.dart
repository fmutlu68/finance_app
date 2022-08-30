import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';

import 'package:json_annotation/json_annotation.dart';

part 'commodity_history.g.dart';

@JsonSerializable()
class CommodityHistory extends IHistoryData<CommodityHistory> {
  double? high;
  double? low;
  double? open;
  CommodityHistory(
      {DateTime? date, double? close, this.high, this.low, this.open})
      : super(date, close);

  @override
  CommodityHistory fromJson(Map<String, dynamic> json) =>
      _$CommodityHistoryFromJson(json);

  @override
  Map<String, dynamic> get toJson => _$CommodityHistoryToJson(this);
}
