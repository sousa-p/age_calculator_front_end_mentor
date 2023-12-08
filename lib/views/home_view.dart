import 'package:age_calculator_front_end_mentor/views/components/calendar_component.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
          width: width,
          height: height,
          child: ColoredBox(
            color: const HSLColor.fromAHSL(1, 0, 0, .86).toColor(),
            child: Center(child: CalendarComponent()),
          )),
    );
  }
}
