import 'package:finance_app/production/features/finance_data/base/model/response_model.dart';

class CalendarData extends ResponseModel {
  final String time;
  final String country;
  final String title;
  final String expected;
  final String explained;
  final String previous;
  final DateTime date;
  final int? priorty;
  CalendarData({
    required this.time,
    required this.country,
    required this.title,
    required this.expected,
    required this.explained,
    required this.previous,
    required this.date,
    this.priorty,
  });
}
