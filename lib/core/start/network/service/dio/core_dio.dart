import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:finance_app/core/base/model/base_error_model.dart';
import 'package:finance_app/core/base/model/base_model.dart';
import 'package:finance_app/core/base/model/base_response_model.dart';
import 'package:finance_app/core/enum/network_request_types.dart';
import 'package:finance_app/core/extensions/network_extension.dart';
import 'package:finance_app/core/models/network/response_model.dart';

import 'i_core_dio.dart';

part '../dio/response_parser.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  CoreDio(BaseOptions baseOptions) {
    options = baseOptions;
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<BaseResponseModel<TResponseModel>> sendRequest<
      TParserModel extends BaseModel<TParserModel>, TResponseModel>({
    required NetworkRequestType requestType,
    required String path,
    required TParserModel parserModel,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await request(path,
        data: data, options: Options(method: requestType.rawValue));
    switch (response.statusCode) {
      case HttpStatus.accepted:
      case HttpStatus.ok:
        final model = _responseParser<TResponseModel, TParserModel>(
            parserModel, response.data);
        return ResponseModel<TResponseModel>(
          statusCode: response.statusCode ?? 0,
          statusMessage: response.statusMessage ?? "",
          data: model,
        );
      default:
        return ResponseModel(
          statusCode: response.statusCode ?? 0,
          statusMessage: response.statusMessage ?? "",
          error: BaseError("Error"),
        );
    }
  }

  @override
  Future<String> getOnlyHtml({required String path}) async {
    return (await request<String>(path)).data ?? "";
  }
}