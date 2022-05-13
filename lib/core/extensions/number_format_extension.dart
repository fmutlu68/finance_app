import 'package:intl/intl.dart';

extension NumberFormatExtension on int {
  String get getStringAsFormatted {
    return NumberFormat("00").format(this);
  }
}
