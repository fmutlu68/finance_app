import 'package:finance_app/production/features/finance_data/models/req/empty_info.dart';

import '../../constant/enum/graph_time_enum.dart';
import '../../features/finance_data/base/model/info_model.dart';

class HistoryDataInfo<T extends InfoModel> {
  T model;
  GraphTime graphTime;
  HistoryDataInfo({required this.model, required this.graphTime});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryDataInfo &&
        other.model.info == model.info &&
        other.model.name == model.name &&
        other.model.path == model.path &&
        other.graphTime == graphTime;
  }

  @override
  int get hashCode => model.hashCode ^ graphTime.hashCode;
}

final emptyDataInfo =
    HistoryDataInfo<EmptyInfo>(model: EmptyInfo(), graphTime: GraphTime.daily);
