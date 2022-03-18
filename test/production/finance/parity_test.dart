import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_parity_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:finance_app/production/features/finance_data/services/parity_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("Email Regexp", () async {
    IParityDataService _dataService =
        ParityDataService(NetworkManager.instance);
    await _dataService.getParity(
        ParityInfo(name: "EUR-USD", info: "Euro/Dolar", path: "eur-usd"));
  });
}
