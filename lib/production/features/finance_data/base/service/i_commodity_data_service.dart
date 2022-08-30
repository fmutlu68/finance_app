import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';

abstract class ICommodityDataService extends IDataService {
  ICommodityDataService({required super.manager});

  Future<ICommodity> getCommodity(CommodityInfo commodity);
  Future<List<ICommodity>> getCommodities(List<CommodityInfo> commodityInfos);
}
