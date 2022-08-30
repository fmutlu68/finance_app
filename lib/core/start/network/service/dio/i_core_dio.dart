import 'package:dio/dio.dart';
import 'package:finance_app/core/base/model/base_model.dart';
import 'package:finance_app/core/base/model/base_response_model.dart';
import 'package:finance_app/core/enum/network_request_types.dart';

abstract class ICoreDio {
  Future<BaseResponseModel<TResponseModel>> sendRequest<
      TParserModel extends BaseModel<TParserModel>, TResponseModel>({
    required NetworkRequestType requestType,
    required String path,
    required TParserModel parserModel,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response<String>> getPage({required String path});
}
