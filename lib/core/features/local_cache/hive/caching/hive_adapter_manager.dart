import 'package:hive/hive.dart';

abstract class IHiveAdapterManager<TAdapter> {
  final String key;
  Box<TAdapter>? _box;
  Box<TAdapter>? get box => _box;

  IHiveAdapterManager(this.key);
  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> put<T>(T key, TAdapter model);
  Future<void> putItems<T>(Map<T, TAdapter> models);
  Future<void> delete<T>(T itemKey);
  TAdapter? getItem<T>(T key);
  List<TAdapter>? getValues();
}
