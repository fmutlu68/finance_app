import 'package:finance_app/production/features/finance_data/base/model/i_money_response_model.dart';

class Parity extends IMoneyResponseModel {
  Parity({
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
}
