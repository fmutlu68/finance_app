import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_economic_calendar_data_service.dart';
import 'package:finance_app/production/features/finance_data/services/economic_calendar_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {},
  );
  test(
    "Economic Calendar Data Test",
    () async {
      IEconomicCalendarDataService service =
          EconomicCalendarDataService(manager: NetworkManager.instance);
      final items = await service.getCalendarData();
      expect(items, hasLength(30));
    },
  );
  test(
    "Day Test",
    () {
      initializeDateFormatting("tr");
      String date = DateFormat.yMMMMd("TR").format(DateTime.now());
      print(
          "${date.split(" ")[0]}_${date.split(" ")[1]}_${date.split(" ")[2]}");
    },
  );
}
