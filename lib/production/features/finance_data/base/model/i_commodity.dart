import 'i_money_response_model.dart';

abstract class ICommodity extends IMoneyResponseModel {
  ICommodity({
    super.dailyGainAsPrice,
    super.dailyGain,
    super.weeklyGain,
    super.monthlyGain,
    super.yearlyGain,
    super.marketsOpen,
    super.lastUpdatedDate,
    super.name,
    String? dailyTopPrice,
    String? price,
    String? dailyLowestPrice,
  }) : super(
          dailyLowestPrice: double.parse(dailyLowestPrice
                  ?.replaceAll(".", "")
                  .replaceAll(",", ".")
                  .replaceAll("\$", "") ??
              ".0"),
          dailyTopPrice: double.parse(dailyTopPrice
                  ?.replaceAll(".", "")
                  .replaceAll(",", ".")
                  .replaceAll("\$", "") ??
              ".0"),
          price: double.parse(price
                  ?.replaceAll(".", "")
                  .replaceAll(",", ".")
                  .replaceAll("\$", "") ??
              ".0"),
        );
}
