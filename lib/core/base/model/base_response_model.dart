import 'base_error_model.dart';

abstract class BaseResponseModel<T> {
  final int statusCode;
  final String statusMessage;
  final T? data;
  final BaseError? error;
  BaseResponseModel({
    required this.statusCode,
    required this.statusMessage,
    this.data,
    this.error,
  });
}
