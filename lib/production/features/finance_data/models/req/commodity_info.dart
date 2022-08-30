import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';

class CommodityInfo extends InfoModel {
  CommodityInfo(
      {required super.name,
      required super.path,
      required super.info,
      super.nameToShow,
      super.hideName,
      super.graphSymbol});

  @override
  String toString() {
    return "$name, $path, $info, $nameToShow, $graphSymbol";
  }
}
