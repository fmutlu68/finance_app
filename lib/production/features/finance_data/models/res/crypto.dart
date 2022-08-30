import 'package:finance_app/production/features/finance_data/base/model/i_money_response_model.dart';

class Crypto extends IMoneyResponseModel {
  Crypto({
    super.dailyGainAsPrice,
    super.name,
    super.lastUpdatedDate,
    super.price,
    super.dailyLowestPrice,
    super.dailyTopPrice,
    super.dailyGain,
    super.weeklyGain,
    super.monthlyGain,
    super.yearlyGain,
    super.marketsOpen,
  });

  @override
  String toString() {
    return 'Crypto(dailyGainAsPrice: $dailyGainAsPrice, name: $name, price: $price, dailyLowestPrice: $dailyLowestPrice, dailyTopPrice: $dailyTopPrice, dailyGain: $dailyGain, weeklyGain: $weeklyGain, monthlyGain: $monthlyGain, yearlyGain: $yearlyGain, marketsOpen: $marketsOpen)';
  }
}
