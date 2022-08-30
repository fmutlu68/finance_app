import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateExtension on DateTime {
  String get dateAsString {
    initializeDateFormatting("tr");
    String date = DateFormat.yMMMMd("TR").format(this);
    return "${date.split(" ")[0]}_${date.split(" ")[1].toLowerCase()}_${date.split(" ")[2]}";
  }

  String get dateAsStringFormatted {
    initializeDateFormatting("tr");
    return DateFormat.yMMMMEEEEd("TR").format(this);
  }

  bool isAtSameDateAs(DateTime? other) {
    return year == other?.year && month == other?.month && day == other?.day;
  }
}
