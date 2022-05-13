import 'dart:async';

import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_currency_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
import 'package:finance_app/production/features/finance_data/services/currency_data_service.dart';
import 'package:flutter/material.dart';

class CurrencyProvider with ChangeNotifier {
  late final ICurrencyDataService _currencyDataService;
  List<CurrencyInfo> currencyInfos = [];
  List<Currency> exCurrencies = [];
  List<Currency> newCurrencies = [];

  bool _isStarted = false;
  bool isUpdated = false;

  CurrencyProvider() {
    _currencyDataService = CurrencyDataService(NetworkManager.instance);
    currencyInfos = [
      CurrencyInfo(
          name: "USD", info: "Amerikan Doları", path: "amerikan-dolari"),
      CurrencyInfo(name: "EUR", info: "Euro", path: "euro"),
      CurrencyInfo(name: "GBP", info: "Sterlin", path: "sterlin"),
      CurrencyInfo(name: "RUB", info: "Rus Rublesi", path: "rus-rublesi"),
      CurrencyInfo(name: "ILS", info: "İsrail Şekeli", path: "israil-sekeli"),
      CurrencyInfo(name: "CHF", info: "İsviçre Frangı", path: "isvicre-frangi"),
      CurrencyInfo(name: "BRL", info: "Brezilya Reali", path: "brezilya-reali"),
      CurrencyInfo(name: "CNY", info: "Çin Yuanı", path: "cin-yuani"),
      CurrencyInfo(
          name: "AZN", info: "Azerbaycan Manatı", path: "azerbaycan-manati"),
    ];
    if (!_isStarted) {
      _isStarted = true;
      startLoadData();
    }
  }

  Future<void> startLoadData() async {
    await loadData();
    Timer.periodic(const Duration(minutes: 1), (timer) async {
      await loadData();
    });
  }

  Future<void> loadData() async {
    try {
      List<Currency> currenciesToUpdate =
          await _currencyDataService.getCurrencies(currencyInfos);
      if (exCurrencies.isEmpty && newCurrencies.isEmpty) {
        exCurrencies = currenciesToUpdate;
        newCurrencies = currenciesToUpdate;
      } else {
        exCurrencies = newCurrencies;
        newCurrencies = currenciesToUpdate;
      }
      isUpdated = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1), () {
        isUpdated = false;
        notifyListeners();
      });
    } catch (error) {
      debugPrint("Catched an Error: $error");
    }
  }
}
