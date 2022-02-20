import 'package:finance_app/core/features/local_cache/base/init_service.dart';
import 'package:finance_app/core/features/local_cache/hive/models/hive_adapter_type.dart';
import 'package:finance_app/core/features/local_cache/hive/models/hive_init_parameters.dart';
import 'package:finance_app/production/models/hive/hive_model.dart';
import 'package:hive/hive.dart';

abstract class IProjectCacheManager<T, R> {
  final InitService<T, R> _cacheService;

  IProjectCacheManager(this._cacheService);

  Future<void> initCacheService();
}

class ProjectCacheManager
    extends IProjectCacheManager<HiveInitParameters, HiveAdapterType> {
  static ProjectCacheManager? _instance;
  static ProjectCacheManager get instance => _instance!;

  static ProjectCacheManager init(
      InitService<HiveInitParameters, HiveAdapterType> cacheService) {
    _instance = ProjectCacheManager._init(cacheService);
    return _instance!;
  }

  ProjectCacheManager._init(
      InitService<HiveInitParameters, HiveAdapterType> cacheService)
      : super(cacheService);

  @override
  Future<void> initCacheService() async {
    await _cacheService.initService(
        data: HiveInitParameters(
            initForFlutter: true, adapterRegister: _registerAdapter));
    await _cacheService.registerTypes(
      models: [
        HiveAdapterType<HiveModel>(
          // type: TypeAdapter<HiveModel>,
          adapter: Test(),
          hiveTypeId: 0,
        ),
      ],
    );
  }

  void _registerAdapter(AdapterRegisterMethod method, HiveAdapterType adapter) {
    if (adapter.adapter is TypeAdapter<HiveModel>) {
      method(adapter.adapter as TypeAdapter<HiveModel>);
    }
  }
}
