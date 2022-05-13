import 'dart:async';

import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_parity_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/parity.dart';
import 'package:finance_app/production/features/finance_data/services/parity_data_service.dart';
import 'package:flutter/material.dart';

class ParityProvider extends ChangeNotifier {
  late final IParityDataService _parityDataService;
  List<ParityInfo> parityInfos = [];
  List<Parity> exParities = [];
  List<Parity> newParities = [];

  bool _isStarted = false;
  bool isUpdated = false;

  ParityProvider() {
    _parityDataService = ParityDataService(NetworkManager.instance);
    parityInfos = [
      ParityInfo(name: "EUR-USD", info: "Euro/Dolar", path: "eur-usd"),
      ParityInfo(name: "USD-EUR", info: "Dolar/Euro", path: "usd-eur"),
      ParityInfo(name: "GBP-USD", info: "Sterlin/Dolar", path: "gbp-usd"),
      ParityInfo(name: "USD-GBP", info: "Dolar/Sterlin", path: "usd-gbp"),
      ParityInfo(name: "USD-JPY", info: "Dolar/Japon Yeni", path: "usd-jpy"),
      ParityInfo(name: "USD-RUB", info: "Dolar/Ruble", path: "usd-rub"),
      ParityInfo(name: "EUR-GBP", info: "Euro/Sterlin", path: "eur-gbp"),
      ParityInfo(name: "GBP-EUR", info: "Sterlin/Euro", path: "gbp-eur"),
    ];
    if (!_isStarted) {
      _isStarted = true;
      startLoadData();
    }
  }

  Future<void> startLoadData() async {
    await loadData();
    Timer.periodic(const Duration(minutes: 4), (timer) async {
      await loadData();
    });
  }

  Future<void> loadData() async {
    List<Parity> paritiesToUpdate =
        await _parityDataService.getParities(parityInfos);
    if (exParities.isEmpty && newParities.isEmpty) {
      exParities = paritiesToUpdate;
      newParities = paritiesToUpdate;
    } else {
      exParities = newParities;
      newParities = paritiesToUpdate;
    }
    isUpdated = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1), () {
      isUpdated = false;
      notifyListeners();
    });
  }
}
