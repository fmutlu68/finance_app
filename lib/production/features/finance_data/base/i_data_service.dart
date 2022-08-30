import 'package:finance_app/core/start/network/service/network_manager.dart';

abstract class IDataService {
  NetworkManager manager;
  IDataService({required this.manager});
}
