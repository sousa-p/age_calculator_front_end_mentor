import 'package:dart_date/dart_date.dart';

class CalendarModel {
  late final int month;
  late final int day;
  late final int year;

  CalendarModel({required this.month, required this.day, required this.year});

  bool isValidMonth() => 0 < month && month < 13;

  bool isValidDay() => 0 < day && day < 32;

  bool isValidYear() => 0 < year;

  bool isValidDate() => Date.isDate(DateTime(year, month, day));
}
