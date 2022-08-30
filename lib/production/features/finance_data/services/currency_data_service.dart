import 'package:finance_app/production/features/finance_data/base/service/i_currency_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/currency_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/double_str_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
import 'package:flutter/foundation.dart';

class CurrencyDataService extends ICurrencyDataService {
  CurrencyDataService({required super.manager});

  @override
  Future<Currency> getCurrency(CurrencyInfo currency) async {
    String parsedHtml = parseHtml((await manager.coreDio.getPage(
          path: UrlPath.currency.path + currency.path,
        ))
            .data ??
        "");
    debugPrint(
        "${currency.name} ${getBuyingCurrency(currency, parsedHtml)}/${getSellingCurrency(currency, parsedHtml)}");
    Map<String, String> daliyLowestAndTopCurrencies =
        getDailyLowestAndTopCurrency(currency, parsedHtml);
    Map<String, String> historicalGains =
        getHistoricalGains(currency, parsedHtml);
    return Currency(
      buyCurrency: getBuyingCurrency(currency, parsedHtml).parseSTR(),
      sellCurrency: getSellingCurrency(currency, parsedHtml).parseSTR(),
      dailyTopCurrency: daliyLowestAndTopCurrencies["top"]!.parseSTR(),
      dailyLowestCurrency: daliyLowestAndTopCurrencies["lowest"]!.parseSTR(),
      dailyGain: getDailyGain(currency, parsedHtml).parseSTR(),
      dailyGainAsTL: getDailyGainAsTL(currency, parsedHtml),
      marketsOpen: getMarketsOpen(currency, parsedHtml),
      weeklyGain: historicalGains["weekly"]!.parseSTR(),
      monthlyGain: historicalGains["monthly"]!.parseSTR(),
      yearlyGain: historicalGains["yearly"]!.parseSTR(),
      name: currency.name,
      lastUpdatedDate: getLastUpdatedDate(currency, parsedHtml),
    );
  }

  @override
  Future<List<Currency>> getCurrencies(List<CurrencyInfo> currencyInfos) async {
    List<Currency> currencies = [];
    for (CurrencyInfo info in currencyInfos) {
      currencies.add(await getCurrency(info));
    }
    return currencies;
  }
}
