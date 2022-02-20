import 'i_local_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheManager extends ILocalCacheManager {
  static LocalCacheManager? _instance;
  static LocalCacheManager get instance {
    _instance ??= LocalCacheManager._init();
    return _instance!;
  }

  LocalCacheManager._init();

  late final SharedPreferences _preferences;

  @override
  Future<void> initCacheService() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  T? get<T>(String key) {
    return _preferences.get(key) as T?;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }
}
