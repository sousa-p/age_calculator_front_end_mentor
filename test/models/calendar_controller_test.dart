import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testar verificações de data', () {
    final CalendarController controller = CalendarController();

    expect(controller.isInvalidDate(), true);

    for (var i = 1; i < 32; i++) {
      controller.calendar.day = i;
      expect(controller.isInvalidDate(), true);
    }

    for (var i = 1; i < 13; i++) {
      controller.calendar.month = i;
      expect(controller.isInvalidDate(), true);
    }

    controller.calendar.year = 2000;
    expect(controller.isInvalidDate(), false);

    controller.calendar.day = 31;
    controller.calendar.month = 2;
    expect(controller.isInvalidDate(), true);
  });
}
