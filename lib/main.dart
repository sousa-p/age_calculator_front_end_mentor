import 'package:age_calculator_front_end_mentor/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const HSLColor.fromAHSL(1, 259, 1, .65).toColor()),
      useMaterial3: true,
    ),
    home: const HomeView(),
  ));
}
