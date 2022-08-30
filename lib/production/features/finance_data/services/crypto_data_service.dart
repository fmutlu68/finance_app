import 'package:finance_app/production/features/finance_data/base/service/i_crypto_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/crypto_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/double_str_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto.dart';
import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';

class CryptoDataService extends ICryptoDataService {
  CryptoDataService({required super.manager});

  @override
  Future<Crypto> getCrypto(CryptoInfo crypto) async {
    String parsedHtml = parseHtml((await manager.coreDio.getPage(
          path: UrlPath.crypto.path + crypto.path,
        ))
            .data ??
        "");
    Map<String, String> daliyLowestAndTopCurrencies =
        getDailyLowestAndTopCrypto(crypto, parsedHtml);
    Map<String, String> historicalGains =
        getHistoricalGains(crypto, parsedHtml);
    return Crypto(
      name: crypto.nameToShow ?? crypto.name,
      price: getPrice(crypto, parsedHtml).parseSTRContainsComma(),
      dailyGain: getDailyGain(crypto, parsedHtml).parseSTR(),
      dailyGainAsPrice: getDailyGainAsPrice(crypto, parsedHtml),
      dailyTopPrice:
          daliyLowestAndTopCurrencies["top"]!.parseSTRContainsComma(),
      dailyLowestPrice:
          daliyLowestAndTopCurrencies["lowest"]!.parseSTRContainsComma(),
      marketsOpen: getMarketsOpen(crypto, parsedHtml),
      monthlyGain: historicalGains["monthly"]!.parseSTR(),
      weeklyGain: historicalGains["weekly"]!.parseSTR(),
      yearlyGain: (historicalGains["yearly"]!.contains(".") &&
              historicalGains["yearly"]!.contains(","))
          ? historicalGains["yearly"]!.parseSTRContainsComma()
          : historicalGains["yearly"]!.parseSTR(),
    );
  }

  @override
  Future<List<Crypto>> getCryptos(List<CryptoInfo> cryptoInfos) async {
    List<Crypto> cryptos = [];
    for (CryptoInfo info in cryptoInfos) {
      cryptos.add(await getCrypto(info));
    }
    return cryptos;
  }
}
