import 'dart:async';

import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_crypto_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto.dart';
import 'package:finance_app/production/features/finance_data/services/crypto_data_service.dart';
import 'package:flutter/material.dart';

class CryptoProvider extends ChangeNotifier {
  late final ICryptoDataService _cryptoDataService;
  List<CryptoInfo> cryptoInfos = [];
  List<Crypto> exCryptos = [];
  List<Crypto> newCryptos = [];

  bool _isStarted = false;
  bool isUpdated = false;

  CryptoProvider() {
    _cryptoDataService = CryptoDataService(manager: NetworkManager.instance);
    cryptoInfos = [
      CryptoInfo(
        nameToShow: "BTC",
        name: "bitcoin",
        info: "Bitcoin",
        path: "bitcoin",
      ),
      CryptoInfo(
        nameToShow: "ETH",
        name: "ethereum",
        info: "Etherium",
        path: "ethereum",
      ),
      CryptoInfo(
        nameToShow: "USDT",
        name: "tether",
        info: "Tether",
        path: "tether",
      ),
      CryptoInfo(
        nameToShow: "XRP",
        name: "ripple",
        info: "Ripple",
        path: "ripple",
      ),
      CryptoInfo(
        nameToShow: "LTC",
        name: "litecoin",
        info: "Litecoin",
        path: "litecoin",
      ),
      CryptoInfo(
        nameToShow: "BUSD",
        name: "binance-usd",
        info: "Binance Usd",
        path: "binance-usd",
      ),
      CryptoInfo(
        nameToShow: "DOGE",
        name: "dogecoin",
        info: "Dogecoin",
        path: "dogecoin",
      ),
      CryptoInfo(
        nameToShow: "SOL",
        name: "solana",
        info: "Solana",
        path: "solana",
      ),
      CryptoInfo(
        nameToShow: "ADA",
        name: "cardano",
        info: "Cardano",
        path: "cardano",
      ),
      CryptoInfo(
        nameToShow: "AVAX",
        name: "avalanche-2",
        info: "Avalanche",
        path: "avalanche-2",
      ),
      CryptoInfo(
        nameToShow: "SHIB",
        name: "shiba-inu",
        info: "Shiba",
        path: "shiba-inu",
      ),
    ];
    if (!_isStarted) {
      _isStarted = true;
      startLoadData();
    }
  }

  Future<void> startLoadData() async {
    await loadData();
    Timer.periodic(const Duration(seconds: 4), (timer) async {
      await loadData();
    });
  }

  Future<void> loadData() async {
    try {
      List<Crypto> cryptosToUpdate =
          await _cryptoDataService.getCryptos(cryptoInfos);
      if (exCryptos.isEmpty && newCryptos.isEmpty) {
        exCryptos = cryptosToUpdate;
        newCryptos = cryptosToUpdate;
      } else {
        exCryptos = newCryptos;
        newCryptos = cryptosToUpdate;
      }
      isUpdated = true;
      notifyListeners();
      await Future.delayed(const Duration(minutes: 1), () {
        isUpdated = false;
        notifyListeners();
      });
    } catch (error) {
      print("Catched an Error: $error");
      print(error.runtimeType);
      isUpdated = false;
      notifyListeners();
    }
  }
}
