import 'package:finance_app/core/extensions/date_time_extension.dart';
import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_economic_calendar_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';
import 'package:finance_app/production/features/finance_data/services/economic_calendar_data_service.dart';
import 'package:flutter/material.dart';

class EconomicCalendarProvider extends ChangeNotifier {
  late final IEconomicCalendarDataService _calendarDataService;
  Map<DateTime, List<CalendarData>> calendarDataListByDates = {};
  bool _isStarted = false;

  EconomicCalendarProvider() {
    _calendarDataService =
        EconomicCalendarDataService(manager: NetworkManager.instance);
    if (!_isStarted) {
      _isStarted = true;
      getCalendarDataByDate(DateTime.now());
    }
  }

  Future<List<CalendarData>> getCalendarDataByDate(DateTime date,
      {bool? isRefresh}) async {
    try {
      if (isRefresh != true &&
          calendarDataListByDates.keys.any(
              (element) => element.isAtSameMomentAs(date.getDateTimeAsDate))) {
        return calendarDataListByDates[date.getDateTimeAsDate] ?? [];
      } else {
        List<CalendarData> newDataList =
            await _calendarDataService.getCalendarData(date: date);
        calendarDataListByDates[date.getDateTimeAsDate] = newDataList;
        notifyListeners();
        return newDataList;
      }
    } catch (error) {
      debugPrint("Catched an Error: $error");
      return [];
    }
  }
}
