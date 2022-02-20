import 'package:finance_app/core/features/local_cache/hive/models/hive_init_parameters.dart';
import 'package:finance_app/core/features/local_cache/hive/models/hive_adapter_type.dart';
import 'package:finance_app/core/features/local_cache/hive/start/i_hive_init_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInitService
    implements IHiveInitService<HiveInitParameters, HiveAdapterType> {
  static HiveInitService? _instance;
  static HiveInitService get instance {
    _instance ??= HiveInitService._init();
    return _instance!;
  }

  HiveInitService._init();
  late final HiveInitParameters params;

  @override
  Future<void> initService({required HiveInitParameters data}) async {
    params = data;
    if (data.initForDart ?? false) {
      Hive.init(data.pathForDart!);
    } else if (data.initForFlutter ?? false) {
      await Hive.initFlutter();
    }
  }

  @override
  Future<void> registerTypes(
      {required List<HiveAdapterType<dynamic>> models}) async {
    for (HiveAdapterType model in models) {
      if (!Hive.isAdapterRegistered(model.hiveTypeId)) {
        params.adapterRegister(Hive.registerAdapter, model);
      }
    }
  }
}
