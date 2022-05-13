import 'package:finance_app/core/base/model/base_model.dart';

class CurrencyResultInfo extends BaseModel<CurrencyResultInfo> {
  int? d;
  double? o;
  double? h;
  double? l;
  double? c;

  CurrencyResultInfo();

  CurrencyResultInfo.fromJson(Map<String, dynamic> json) {
    d = json['d'];
    o = json['o'];
    h = json['h'];
    l = json['l'];
    c = json['c'];
  }

  @override
  CurrencyResultInfo fromJson(Map<String, dynamic> json) {
    return CurrencyResultInfo.fromJson(json);
  }

  @override
  Map<String, dynamic> get toJson => {};
}
