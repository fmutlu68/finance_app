abstract class ILocalCacheManager {
  Future<void> initCacheService();
  Future<void> setString(String key, String value);
  Future<void> setBool(String key, bool value);
  T? get<T>(String key);
}
