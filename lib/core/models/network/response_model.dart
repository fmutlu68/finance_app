import 'package:finance_app/core/base/model/base_error_model.dart';
import 'package:finance_app/core/base/model/base_response_model.dart';

class ResponseModel<T> extends BaseResponseModel<T> {
  ResponseModel({
    required int statusCode,
    required String statusMessage,
    T? data,
    BaseError? error,
  }) : super(
          statusCode: statusCode,
          statusMessage: statusMessage,
          data: data,
          error: error,
        );
}
