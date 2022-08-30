import 'package:finance_app/core/base/model/base_model.dart';

abstract class IHistoryData<T> extends BaseModel<T> {
  DateTime? date;
  double? close;

  IHistoryData(this.date, this.close);
}
