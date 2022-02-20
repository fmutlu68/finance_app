abstract class InitService<T, R> {
  Future<void> initService({required T data});
  Future<void> registerTypes({required List<R> models});
}
