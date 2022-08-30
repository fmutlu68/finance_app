import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';

import '../../models/res/calendar_data.dart';

abstract class IEconomicCalendarDataService extends IDataService {
  IEconomicCalendarDataService({required super.manager});

  Future<List<CalendarData>> getCalendarData({DateTime? date});
}
