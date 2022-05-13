import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_currency_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/services/currency_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("Doviz com test", () async {
    ICurrencyDataService currencyDataService =
        CurrencyDataService(NetworkManager.instance);
    await currencyDataService.getCurrency(
        CurrencyInfo(name: "USD", path: "amerikan-dolari", info: ""));
    CurrencyDataService(NetworkManager.instance);
    await currencyDataService
        .getCurrency(CurrencyInfo(name: "RUB", path: "rus-rublesi", info: ''));
    await currencyDataService
        .getCurrency(CurrencyInfo(name: "EUR", path: "euro", info: ''));
    await currencyDataService
        .getCurrency(CurrencyInfo(name: "GBP", path: "sterlin", info: ''));
    await currencyDataService.getCurrency(
        CurrencyInfo(name: "KWD", path: "kuveyt-dinari", info: ''));
  });
}
