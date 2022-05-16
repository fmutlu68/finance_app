import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_commodity_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/features/finance_data/services/commodity_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("Email Regexp", () async {
    ICommodityDataService commodityDataService =
        CommodityDataService(manager: NetworkManager.instance);
    debugPrint((await commodityDataService.getCommodity(CommodityInfo(
            name: "ceyrek-altin", path: "ceyrek-altin", info: "Çeyrek Altın")))
        .toString());
  });
}
