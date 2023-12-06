class CalendarModel {
  late int month;
  late int day;
  late int year;

  CalendarModel({required this.month, required this.day, required this.year});

  bool isValidMonth() => 0 < month && month < 13;

  bool isValidDay() => 0 < day && day < 32;

  bool isValidYear() => 0 < year && year <= DateTime.now().year;

  bool isValidDate() => isValidMonth() && isValidDay() && isValidYear();

  Map<String, int> calcDiff() {
    DateTime now = DateTime.now();
    DateTime calendarDate = DateTime(year, month, day);

    int yearsDiff = now.year - calendarDate.year;
    int monthsDiff = now.month - calendarDate.month;

    int daysDiff = now.day - calendarDate.day;

    if (monthsDiff < 0) {
      yearsDiff--;
      monthsDiff += 12;
    }

    if (daysDiff < 0) {
      daysDiff = daysDiff.abs();
    }

    return {'years': yearsDiff, 'months': monthsDiff, 'days': daysDiff};
  }
}
