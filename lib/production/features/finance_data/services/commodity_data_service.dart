import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_commodity_data_service.dart';
import 'package:finance_app/production/features/finance_data/extension/commodity_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/double_str_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/commodity_tl.dart';
import 'package:finance_app/production/features/finance_data/models/res/commodity_usd.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';

class CommodityDataService extends ICommodityDataService {
  CommodityDataService({required super.manager});

  @override
  Future<List<ICommodity>> getCommodities(
      List<CommodityInfo> commodityInfos) async {
    List<ICommodity> currencies = [];
    for (CommodityInfo info in commodityInfos) {
      currencies.add(await getCommodity(info));
    }
    return currencies;
  }

  @override
  Future<ICommodity> getCommodity(CommodityInfo commodity) async {
    String parsedHtml = parseHtml((await manager.coreDio.getPage(
          path: getMainPath(commodity) + commodity.path,
        ))
            .data ??
        "");
    Map<String, String> daliyLowestAndTopCurrencies =
        getDailyLowestAndTopCommodity(commodity, parsedHtml);
    Map<String, String> historicalGains =
        getHistoricalGains(commodity, parsedHtml);
    return isCommodityByTL(commodity)
        ? CommodityTL(
            price: getBuyingPrice(commodity, parsedHtml),
            dailyLowestPrice: daliyLowestAndTopCurrencies["top"],
            dailyTopPrice: daliyLowestAndTopCurrencies["lowest"],
            dailyGain: getDailyGain(commodity, parsedHtml).parseSTR(),
            dailyGainAsTL: getDailyGainAsPrice(commodity, parsedHtml).trim(),
            marketsOpen: getMarketsOpen(commodity, parsedHtml),
            weeklyGain: historicalGains["weekly"]!.parseSTR(),
            monthlyGain: historicalGains["monthly"]!.parseSTR(),
            yearlyGain: historicalGains["yearly"]!.parseSTR(),
            name: commodity.nameToShow ?? commodity.name,
          )
        : CommodityUSD(
            price: getBuyingPrice(commodity, parsedHtml),
            dailyLowestPrice: daliyLowestAndTopCurrencies["top"],
            dailyTopPrice: daliyLowestAndTopCurrencies["lowest"],
            dailyGain: getDailyGain(commodity, parsedHtml).parseSTR(),
            dailyGainAsUSD: getDailyGainAsPrice(commodity, parsedHtml),
            marketsOpen: getMarketsOpen(commodity, parsedHtml),
            weeklyGain: historicalGains["weekly"]!.parseSTR(),
            monthlyGain: historicalGains["monthly"]!.parseSTR(),
            yearlyGain: historicalGains["yearly"]!.parseSTR(),
            name: commodity.nameToShow ?? commodity.name,
          );
  }
}
