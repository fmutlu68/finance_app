import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';

class CommodityUSD extends ICommodity {
  CommodityUSD({
    String? dailyGainAsUSD,
    super.price,
    super.dailyLowestPrice,
    super.dailyTopPrice,
    super.dailyGain,
    super.weeklyGain,
    super.monthlyGain,
    super.yearlyGain,
    super.marketsOpen,
    super.name,
    super.lastUpdatedDate,
  }) : super(dailyGainAsPrice: dailyGainAsUSD);

  @override
  String toString() {
    return 'Commodity(price: $price, dailyLowestPrice: $dailyLowestPrice, dailyTopPrice: $dailyTopPrice, dailyGain: $dailyGain, weeklyGain: $weeklyGain, monthlyGain: $monthlyGain, yearlyGain: $yearlyGain, marketsOpen: $marketsOpen, dailyGainAsUSD: $dailyGainAsPrice)';
  }
}
