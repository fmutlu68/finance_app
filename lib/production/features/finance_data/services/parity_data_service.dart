import 'package:finance_app/production/features/finance_data/base/service/i_parity_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/double_str_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/time_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/parity.dart';
import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:flutter/material.dart';

part '../extension/parity_parser_extension.dart';

class ParityDataService extends IParityDataService {
  ParityDataService({required super.manager});

  @override
  Future<Parity> getParity(ParityInfo parity) async {
    String parsedHtml = parseHtml((await manager.coreDio.getPage(
          path: UrlPath.parity.path + parity.path,
        ))
            .data ??
        "");
    Map<String, String> daliyLowestAndTopCurrencies =
        getDailyLowestAndTopParity(parity, parsedHtml);
    Map<String, String> historicalGains =
        getHistoricalGains(parity, parsedHtml);
    return Parity(
      price: getPrice(parity, parsedHtml).parseSTR(),
      dailyGain: getDailyGain(parity, parsedHtml).parseSTR(),
      dailyGainAsPrice: getDailyGainAsPrice(parity, parsedHtml),
      dailyLowestPrice: daliyLowestAndTopCurrencies["lowest"]!.parseSTR(),
      dailyTopPrice: daliyLowestAndTopCurrencies["top"]!.parseSTR(),
      marketsOpen: getMarketsOpen(parity, parsedHtml),
      name: parity.name,
      weeklyGain: historicalGains["weekly"]!.parseSTR(),
      monthlyGain: historicalGains["monthly"]!.parseSTR(),
      yearlyGain: historicalGains["yearly"]!.parseSTR(),
    );
  }

  @override
  Future<List<Parity>> getParities(List<ParityInfo> parityInfos) async {
    List<Parity> parities = [];
    for (ParityInfo info in parityInfos) {
      parities.add(await getParity(info));
    }
    return parities;
  }
}
