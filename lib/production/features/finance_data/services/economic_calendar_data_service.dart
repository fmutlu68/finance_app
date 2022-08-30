import 'package:finance_app/production/features/finance_data/base/service/i_economic_calendar_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/date_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/economic_calendar_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';

class EconomicCalendarDataService extends IEconomicCalendarDataService {
  EconomicCalendarDataService({required super.manager});

  @override
  Future<List<CalendarData>> getCalendarData({DateTime? date}) async {
    print(UrlPath.economicCalendar.path +
        (date == null ? DateTime.now().dateAsString : date.dateAsString));
    String parsedHtml = parseHtml((await manager.coreDio.getPage(
                path: UrlPath.economicCalendar.path +
                    (date == null
                        ? DateTime.now().dateAsString
                        : date.dateAsString)))
            .data ??
        "");
    return getCalendarDataList(parsedHtml, date ?? DateTime.now());
  }
}
