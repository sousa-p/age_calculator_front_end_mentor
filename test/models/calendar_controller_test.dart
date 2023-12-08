import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testar verificações de data', () {
    final CalendarController controller = CalendarController();

    expect(controller.isInvalidDay(), true);
    expect(controller.isInvalidMonth(), true);
    expect(controller.isInvalidYear(), true);

    for (var i = 1; i < 32; i++) {
      controller.calendar.day = i;
      expect(controller.isInvalidDay(), false);
    }

    for (var i = 1; i < 13; i++) {
      controller.calendar.month = i;
      expect(controller.isInvalidMonth(), false);
    }

    controller.calendar.year = 2000;
    expect(controller.isInvalidYear(), false);
  });
}
