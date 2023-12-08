import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:age_calculator_front_end_mentor/views/breakpoints.dart';
import 'package:age_calculator_front_end_mentor/views/components/form_calendar_component.dart';
import 'package:flutter/material.dart';

class CalendarComponent extends StatelessWidget {
  final Breakpoints brk = Breakpoints();
  final CalendarController controller = CalendarController();

  CalendarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      widthFactor: (width < brk.mobile)
          ? .90
          : (width < brk.tablet)
              ? .8
              : 850 / width,
      heightFactor: 600 / height,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(180)),
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [FormCalendarComponent(controller: controller)],
            ),
          ),
        ),
      ),
    );
  }
}
