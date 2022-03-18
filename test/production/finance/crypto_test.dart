import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_crypto_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
import 'package:finance_app/production/features/finance_data/services/crypto_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("Doviz com Crypto Service", () async {
    ICryptoDataService _cryptoDataService =
        CryptoDataService(NetworkManager.instance);
    print((await _cryptoDataService.getCrypto(CryptoInfo(
            nameToShow: "BTC",
            name: "bitcoin",
            info: "Bitcoin",
            path: "bitcoin")))
        .toString());
  });
}
