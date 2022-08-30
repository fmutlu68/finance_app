import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';

abstract class ICurrencyDataService extends IDataService {
  ICurrencyDataService({required super.manager});

  Future<Currency> getCurrency(CurrencyInfo currency);
  Future<List<Currency>> getCurrencies(List<CurrencyInfo> currencyInfos);
}
