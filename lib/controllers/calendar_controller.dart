import 'package:age_calculator_front_end_mentor/models/calendar_model.dart';
import 'package:flutter/material.dart';

class CalendarController {
  final CalendarModel calendar = CalendarModel(month: 0, year: 0, day: 0);
  late Map<String, dynamic> diff = {
    'year': '--',
    'month': '--',
    'day': '--',
  };

  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  bool isInvalidMonth() => 0 > calendar.month || calendar.month > 12;

  bool isInvalidDay() => 0 > calendar.day || calendar.day > 31;

  bool isInvalidYear() =>
      0 > calendar.year || calendar.year > DateTime.now().year;

  Map<String, dynamic> calcDiff() {
    DateTime now = DateTime.now();

    int yearsDiff = now.year - calendar.year;
    int monthsDiff = now.month - calendar.month;

    int daysDiff = now.day - calendar.day;

    if (monthsDiff < 0) {
      yearsDiff--;
      monthsDiff += 12;
    }

    if (daysDiff < 0) {
      (monthsDiff > 1) ? monthsDiff-- : (monthsDiff = 12, yearsDiff--);
      if (yearsDiff < 0) yearsDiff = 0;
      daysDiff = daysDiff.abs();
    }

    return {
      'year': yearsDiff,
      'month': monthsDiff,
      'day': daysDiff,
    };
  }

  Map<String, dynamic> error() {
    return {
      'year': '--',
      'month': '--',
      'day': '--',
    };
  }
}
