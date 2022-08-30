import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto.dart';

abstract class ICryptoDataService extends IDataService {
  ICryptoDataService({required super.manager});

  Future<Crypto> getCrypto(CryptoInfo crypto);
  Future<List<Crypto>> getCryptos(List<CryptoInfo> cryptoInfos);
}
