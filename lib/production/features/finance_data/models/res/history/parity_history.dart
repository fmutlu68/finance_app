import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';

import 'package:json_annotation/json_annotation.dart';

part 'parity_history.g.dart';

@JsonSerializable()
class ParityHistory extends IHistoryData<ParityHistory> {
  double? open;
  double? high;
  double? low;

  ParityHistory({
    DateTime? date,
    double? close,
    this.open,
    this.high,
    this.low,
  }) : super(date, close);
  @override
  ParityHistory fromJson(Map<String, dynamic> json) =>
      _$ParityHistoryFromJson(json);

  @override
  Map<String, dynamic> get toJson => _$ParityHistoryToJson(this);
}
