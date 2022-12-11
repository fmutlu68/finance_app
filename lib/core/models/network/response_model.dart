import 'package:dio/dio.dart';
import 'package:finance_app/core/base/model/base_response_model.dart';

class ResponseModel<T> extends BaseResponseModel<T> {
  final Headers? headers;
  ResponseModel({
    this.headers,
    required super.statusCode,
    required super.statusMessage,
    super.data,
    super.error,
  });
}
