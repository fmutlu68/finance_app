import 'package:finance_app/production/features/finance_data/base/model/response_model.dart';

abstract class IMoneyResponseModel extends ResponseModel {
  String? dailyGainAsPrice;
  String? name;
  String? lastUpdatedDate;
  double? buyPrice;
  double? sellPrice;
  double? price;
  double? dailyLowestPrice;
  double? dailyTopPrice;
  double? dailyGain;
  double? weeklyGain;
  double? monthlyGain;
  double? yearlyGain;
  bool? marketsOpen;
  IMoneyResponseModel({
    required this.dailyGainAsPrice,
    required this.lastUpdatedDate,
    required this.dailyLowestPrice,
    required this.dailyTopPrice,
    required this.dailyGain,
    required this.weeklyGain,
    required this.monthlyGain,
    required this.yearlyGain,
    required this.marketsOpen,
    this.name,
    this.buyPrice,
    this.sellPrice,
    this.price,
  }) : assert(price != null || buyPrice != null, "Must select one of prices");
}
