import 'package:age_calculator_front_end_mentor/models/calendar_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testar verificações de data', () {
    final CalendarModel model = CalendarModel(month: -1, day: -1, year: -1);

    expect(model.isValidDay(), false);
    expect(model.isValidMonth(), false);
    expect(model.isValidYear(), false);
    expect(model.isValidDate(), false);

    for (var i = 1; i < 32; i++) {
      model.day = i;
      expect(model.isValidDay(), true);
    }

    for (var i = 1; i < 13; i++) {
      model.month = i;
      expect(model.isValidMonth(), true);
    }

    model.year = 2000;
    expect(model.isValidYear(), true);

    expect(model.isValidDate(), true);
  });
}
