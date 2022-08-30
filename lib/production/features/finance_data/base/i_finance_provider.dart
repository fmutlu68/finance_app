part of '../finance_provider.dart';

abstract class IFinanceProvider {
  final ICurrencyDataService _currencyService;

  IFinanceProvider(this._currencyService);

  Future<Currency> getCurrency(CurrencyInfo info);
}
