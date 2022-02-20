import 'package:finance_app/core/enum/network_request_types.dart';

extension NetworkRequestTypeValueExtension on NetworkRequestType {
  String get rawValue {
    switch (this) {
      case NetworkRequestType.get:
        return "GET";
      case NetworkRequestType.post:
        return "POST";
    }
  }
}
