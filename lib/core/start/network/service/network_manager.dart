import 'package:finance_app/core/start/network/service/dio/core_dio.dart';
import 'package:finance_app/core/start/network/service/dio/i_core_dio.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late final BaseOptions options;
  late final ICoreDio coreDio;

  NetworkManager._init() {
    options = BaseOptions();
    coreDio = CoreDio(options);
  }
}
