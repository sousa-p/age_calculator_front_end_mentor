import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColoredBox(color: const HSLColor.fromAHSL(1, 0, 0, .86).toColor()),
          const Center(
            child: CalendarView(),
          )
        ],
      ),
    );
  }
}
