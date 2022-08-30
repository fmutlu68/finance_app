import 'package:finance_app/production/features/finance_data/base/model/i_money_response_model.dart';

class Currency extends IMoneyResponseModel {
  Currency({
    required super.lastUpdatedDate,
    required super.dailyGain,
    required super.weeklyGain,
    required super.monthlyGain,
    required super.yearlyGain,
    required super.marketsOpen,
    super.name,
    String? dailyGainAsTL,
    double? buyCurrency,
    double? sellCurrency,
    double? dailyLowestCurrency,
    double? dailyTopCurrency,
  }) : super(
            dailyGainAsPrice: dailyGainAsTL,
            dailyLowestPrice: dailyLowestCurrency,
            dailyTopPrice: dailyTopCurrency,
            buyPrice: buyCurrency,
            sellPrice: sellCurrency);
}
