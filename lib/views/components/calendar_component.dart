import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:age_calculator_front_end_mentor/views/breakpoints.dart';
import 'package:age_calculator_front_end_mentor/views/components/diff_line_component.dart';
import 'package:age_calculator_front_end_mentor/views/components/line_component.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator_front_end_mentor/views/components/input_calendar_component.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              ? .75
              : 700 / width,
      heightFactor: 600 / height,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(150)),
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 16,
                          children: [
                            InputCalendarComponent(
                                label: 'Day',
                                placeholder: 'dd',
                                validator: controller.isInvalidDate,
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
                                validator: controller.isInvalidDate,
                                controller: controller.monthController,
                                onChanged: (value) {
                                  setState(() {
                                    controller.calendar.month =
                                        int.tryParse(value) ?? 0;
                                  });
                                }),
                            InputCalendarComponent(
                                label: 'Year',
                                placeholder: 'yyyy',
                                validator: controller.isInvalidDate,
                                controller: controller.yearController,
                                onChanged: (value) {
                                  setState(() {
                                    controller.calendar.year =
                                        int.tryParse(value) ?? 0;
                                  });
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Stack(
                          children: [
                            const LineComponent(width: 500),
                            Row(
                              mainAxisAlignment: (width > brk.tablet)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        controller.diff =
                                            (_formKey.currentState!.validate())
                                                ? controller.calcDiff()
                                                : controller.error();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(16),
                                        backgroundColor:
                                            const HSLColor.fromAHSL(
                                                    1, 259, 1, .65)
                                                .toColor()),
                                    child: SizedBox(
                                      width: 32,
                                      child: SvgPicture.asset(
                                        'assets/images/icon-arrow.svg',
                                        semanticsLabel: 'Calculate',
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                Column(
                  children: [
                    DiffLine(value: controller.diff.years, label: 'years'),
                    DiffLine(value: controller.diff.months, label: 'months'),
                    DiffLine(value: controller.diff.days, label: 'days'),
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
