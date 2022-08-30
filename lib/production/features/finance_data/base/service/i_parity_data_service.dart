import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/parity.dart';

abstract class IParityDataService extends IDataService {
  IParityDataService({required super.manager});

  Future<Parity> getParity(ParityInfo parity);
  Future<List<Parity>> getParities(List<ParityInfo> parityInfos);
}
