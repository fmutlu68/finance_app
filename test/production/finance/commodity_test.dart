import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_commodity_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/features/finance_data/services/commodity_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("Email Regexp", () async {
    ICommodityDataService commodityDataService =
        CommodityDataService(NetworkManager.instance);
    debugPrint((await commodityDataService.getCommodity(CommodityInfo(
            name: "ceyrek-altin", path: "ceyrek-altin", info: "Çeyrek Altın")))
        .toString());
    // CurrencyDataService(NetworkManager.instance);
    // print(await currencyDataService.getCurrency(
    //     CurrencyInfo(name: "RUB", path: "rus-rublesi", date: DateTime.now())));
    // await currencyDataService.getCurrency(
    //     CurrencyInfo(name: "EUR", path: "euro", date: DateTime.now()));
    // await currencyDataService.getCurrency(
    //     CurrencyInfo(name: "GBP", path: "sterlin", date: DateTime.now()));
    // await currencyDataService.getCurrency(
    //     CurrencyInfo(name: "KWD", path: "kuveyt-dinari", date: DateTime.now()));
  });
}
