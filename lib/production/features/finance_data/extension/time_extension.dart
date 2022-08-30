import 'package:flutter/material.dart';

extension TimeExtension on TimeOfDay {
  TimeOfDay operator -(TimeOfDay time) {
    int totalMinute = (hour * 60 + minute) - (time.hour * 60 + time.minute);
    int newHour = (totalMinute / 60).floor();
    int newMinute = totalMinute - newHour * 60;
    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  bool operator <(TimeOfDay value) {
    return (hour * 60 + minute) >= 0 &&
        (hour * 60 + minute) < (value.hour * 60 + value.minute);
  }
}
