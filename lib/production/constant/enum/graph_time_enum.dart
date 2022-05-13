enum GraphTime { last2Hours, daily, week, lastMonth, last3Month, year }

extension GraphTimeTextExtension on GraphTime {
  String get text {
    switch (this) {
      case GraphTime.last2Hours:
        return "2 S";
      case GraphTime.daily:
        return "Bugün";
      case GraphTime.lastMonth:
        return "1 Ay";
      case GraphTime.last3Month:
        return "3 Ay";
      case GraphTime.year:
        return "1 Yıl";
      case GraphTime.week:
        return "1 Hafta";
    }
  }

  List<DateTime> get dates {
    switch (this) {
      case GraphTime.daily:
      case GraphTime.last2Hours:
        return const [];
      case GraphTime.week:
        return [
          DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch -
                  DateTime(1970, 1, 9).millisecondsSinceEpoch),
          DateTime.now(),
        ];
      case GraphTime.lastMonth:
        return [
          DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch -
                  DateTime(1970, 2, 1).millisecondsSinceEpoch),
          DateTime.now(),
        ];
      case GraphTime.last3Month:
        return [
          DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch -
                  DateTime(1970, 4, 1).millisecondsSinceEpoch),
          DateTime.now(),
        ];
      case GraphTime.year:
        return [
          DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch -
                  DateTime(1971, 1, 1).millisecondsSinceEpoch),
          DateTime.now(),
        ];
    }
  }
}
