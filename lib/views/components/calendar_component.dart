import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:age_calculator_front_end_mentor/views/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator_front_end_mentor/views/components/input_calendar_component.dart';

class CalendarComponent extends StatefulWidget {
  const CalendarComponent({super.key});

  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent> {
  final Breakpoints brk = Breakpoints();
  final CalendarController controller = CalendarController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 16,
                          children: [
                            InputCalendarComponent(
                                label: 'Day',
                                placeholder: 'dd',
                                validator: controller.isInvalidDay,
                                controller: controller.dayController,
                                onChanged: (value) {
                                  setState(() {
                                    controller.calendar.day =
                                        int.tryParse(value) ?? 0;
                                  });
                                }),
                            InputCalendarComponent(
                                label: 'Month',
                                placeholder: 'mm',
                                validator: controller.isInvalidMonth,
                                controller: controller.monthController,
                                onChanged: (value) {
                                  setState(() {
                                    controller.calendar.month =
                                        int.tryParse(value) ?? 0;
                                  });
                                }),
                            InputCalendarComponent(
                                label: 'Year',
                                placeholder: 'yy',
                                validator: controller.isInvalidYear,
                                controller: controller.yearController,
                                onChanged: (value) {
                                  setState(() {
                                    controller.calendar.year =
                                        int.tryParse(value) ?? 0;
                                  });
                                }),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                controller.diff =
                                    (_formKey.currentState!.validate())
                                        ? controller.calcDiff()
                                        : controller.error();
                              });
                            },
                            child: const Text('Calcular')),
                      ],
                    )),
                Column(
                  children: [
                    Text('${controller.diff['day']} days'),
                    Text('${controller.diff['month']} months'),
                    Text('${controller.diff['year']} years'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
