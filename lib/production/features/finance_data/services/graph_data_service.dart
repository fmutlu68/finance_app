import 'dart:io';

import 'package:finance_app/core/enum/network_request_types.dart';
import 'package:finance_app/core/extensions/cookie_extension.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_history_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/date_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/time_extension.dart';
import 'package:flutter/material.dart';

import '../base/model/i_history_data.dart';
import '../base/model/info_model.dart';

class HistoryDataService extends IHistoryDataService {
  HistoryDataService({required super.manager});
  final List<Cookie> cookies = [
    Cookie("token",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZvcmVrcy5jb20iLCJwYXNzd29yZCI6InY0YSFLJTJSIiwiaWF0IjoxNjUyNjEwMzM4fQ.hpQAq6aB-_rWL1CUQywTy_sKQjhYKy0WT6JQXyVsyQs")
  ];

  @override
  Future<List<R>> getDailyGraph<T extends InfoModel, R extends IHistoryData<R>>(
      T model, R parserModel) async {
    print(UrlPath.dailyHistory.path.replaceFirst("[CurCode]", model.name));
    final response = await manager.coreDio.sendRequest<R, List<R>>(
        requestType: NetworkRequestType.get,
        path: UrlPath.dailyHistory.path.replaceAll("[CurCode]", model.name),
        parserModel: parserModel,
        headers: {}..addCookies(cookies));
    return response.data
            ?.where((element) => element.date == null
                ? false
                : element.date!.isAtSameDateAs(response.data?.last.date))
            .toList() ??
        [];
  }

  @override
  Future<List<R>>
      getGraphBetweenDate<T extends InfoModel, R extends IHistoryData<R>>(
          T model, R parserModel, DateTime startDate, DateTime endDate) async {
    print(UrlPath.currencyHistory.path
        .replaceAll("[CurCode]", model.name)
        .replaceAll(
            "[StartDate]", startDate.toUtc().millisecondsSinceEpoch.toString())
        .replaceAll(
            "[EndDate]", endDate.toUtc().millisecondsSinceEpoch.toString()));
    final response = await manager.coreDio.sendRequest<R, List<R>>(
        requestType: NetworkRequestType.get,
        path: UrlPath.currencyHistory.path
            .replaceAll("[CurCode]", model.name)
            .replaceAll(
                "[StartDate]", startDate.millisecondsSinceEpoch.toString())
            .replaceAll("[EndDate]", endDate.millisecondsSinceEpoch.toString()),
        parserModel: parserModel,
        headers: {}..addCookies(cookies));
    return response.data?.where((element) => element.date != null).toList() ??
        [];
  }

  @override
  Future<List<R>>
      getLast2HoursGraph<T extends InfoModel, R extends IHistoryData<R>>(
          T model, R parserModel) async {
    print(UrlPath.last2HoursHistory.path.replaceAll("[CurCode]", model.name));
    final response = await manager.coreDio.sendRequest<R, List<R>>(
        requestType: NetworkRequestType.get,
        path:
            UrlPath.last2HoursHistory.path.replaceAll("[CurCode]", model.name),
        parserModel: parserModel,
        headers: {}..addCookies(cookies));
    return response.data
            ?.where((element) => element.date == null
                ? false
                : element.date!.isAtSameDateAs(response.data?.last.date) &&
                    ((TimeOfDay.fromDateTime(response.data!.last.date!) -
                            TimeOfDay.fromDateTime(element.date!)) <
                        const TimeOfDay(hour: 2, minute: 0)))
            .toList() ??
        [];
  }
}
