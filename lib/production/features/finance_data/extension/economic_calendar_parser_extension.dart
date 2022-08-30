import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';
import 'package:finance_app/production/features/finance_data/services/economic_calendar_data_service.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

extension EconomicCalendarParserExtension on EconomicCalendarDataService {
  List<CalendarData> getCalendarDataList(String html, DateTime date) {
    Element tableBodyElement = parse(html).getElementsByClassName("ptBody")[0];
    List<Element> tableBodyItemList =
        tableBodyElement.getElementsByTagName("ul");

    return tableBodyItemList.map(
      (item) {
        return CalendarData(
            time: item.getElementsByClassName("ptTim")[0].text,
            country: item.getElementsByClassName("ptCou")[0].text,
            title: item.getElementsByClassName("ptGos")[0].text,
            expected: item.getElementsByClassName("ptAci")[0].text,
            explained: item.getElementsByClassName("ptBek")[0].text,
            previous: item.getElementsByClassName("ptPre")[0].text,
            date: date);
      },
    ).toList();
  }
}
