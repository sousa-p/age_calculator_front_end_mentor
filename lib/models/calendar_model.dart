class CalendarModel {
  late final int mouth;
  late final int day;
  late final int year;

  CalendarModel({required this.mouth, required this.day, required this.year});

  bool isValidMouth() => 0 < mouth && mouth < 13;

  bool isValidDay() => 0 < day && day < 32;

  bool isValidYear() => 0 < year;
}
