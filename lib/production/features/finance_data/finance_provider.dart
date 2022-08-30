import 'package:finance_app/production/features/finance_data/base/service/i_currency_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';

part 'base/i_finance_provider.dart';

class FinanceProvider extends IFinanceProvider {
  FinanceProvider({required ICurrencyDataService currencyService})
      : super(currencyService);

  @override
  Future<Currency> getCurrency(CurrencyInfo info) async {
    return await _currencyService.getCurrency(info);
  }
}
