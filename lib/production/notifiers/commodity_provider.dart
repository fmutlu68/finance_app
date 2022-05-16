import 'dart:async';

import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_commodity_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/features/finance_data/services/commodity_data_service.dart';
import 'package:flutter/material.dart';

class CommodityProvider with ChangeNotifier {
  late final ICommodityDataService _commodityDataService;
  List<CommodityInfo> commodityInfos = [];
  List<ICommodity> exCommodities = [];
  List<ICommodity> newCommodities = [];

  bool _isStarted = false;
  bool isUpdated = false;

  CommodityProvider() {
    _commodityDataService =
        CommodityDataService(manager: NetworkManager.instance);
    commodityInfos = [
      CommodityInfo(name: "XAU-USD", info: "Ons Altın", path: "altin-ons"),
      CommodityInfo(
          name: "gram-altin",
          info: "Gram Altın",
          path: "gram-altin",
          nameToShow: "GAU-TRY",
          graphSymbol: "SGLD"),
      CommodityInfo(
          name: "ceyrek-altin",
          info: "Çeyrek Altın",
          path: "ceyrek-altin",
          hideName: true,
          graphSymbol: "SGCEYREK"),
      CommodityInfo(name: "BRENT", info: "Brent Petrol", path: "brent-petrol"),
      CommodityInfo(name: "XAG-USD", info: "Ons Gümüş", path: "gumus-ons"),
      CommodityInfo(
          name: "gumus",
          info: "Gram Gümüş",
          path: "gumus",
          nameToShow: "XAG-TRY",
          graphSymbol: "SXAG"),
      CommodityInfo(name: "XPT-USD", info: "Platinum", path: "platinum"),
      CommodityInfo(name: "XPD-USD", info: "Paladyum", path: "paladyum"),
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
      List<ICommodity> commoditiesToUpdate =
          await _commodityDataService.getCommodities(commodityInfos);
      if (exCommodities.isEmpty && newCommodities.isEmpty) {
        exCommodities = commoditiesToUpdate;
        newCommodities = commoditiesToUpdate;
      } else {
        exCommodities = newCommodities;
        newCommodities = commoditiesToUpdate;
      }
      isUpdated = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1), () {
        isUpdated = false;
        notifyListeners();
      });
    } catch (error) {
      print("Catched an Error: $error");
      isUpdated = false;
      notifyListeners();
    }
  }
}
