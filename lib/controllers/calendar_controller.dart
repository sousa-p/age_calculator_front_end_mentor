import 'package:age_calculator_front_end_mentor/models/calendar_model.dart';
import 'package:age_calculator_front_end_mentor/models/diff_model.dart';
import 'package:flutter/material.dart';

class CalendarController {
  final CalendarModel calendar = CalendarModel(month: 0, year: 0, day: 0);
  late DiffModel diff = error();

  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  String parsedDateToString() {
    String year = calendar.year.toString();
    String month = calendar.month.toString().padLeft(2, '0');
    String day = calendar.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  bool isInvalidDate() {
    try {
      String dateString = parsedDateToString();
      DateTime date = DateTime.parse(dateString);

      bool isInvalid = date.year.toString() != dateString.substring(0, 4) ||
          date.month.toString().padLeft(2, '0') != dateString.substring(5, 7) ||
          date.day.toString().padLeft(2, '0') != dateString.substring(8, 10);

      return isInvalid;
    } catch (_) {
      return true;
    }
  }

  DiffModel calcDiff() {
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

    return DiffModel(
        months: monthsDiff.toString().padLeft(2, '0'),
        days: daysDiff.toString().padLeft(2, '0'),
        years: yearsDiff.toString().padLeft(2, '0'));
  }

  DiffModel error() {
    return DiffModel(months: '--', days: '--', years: '--');
  }
}
