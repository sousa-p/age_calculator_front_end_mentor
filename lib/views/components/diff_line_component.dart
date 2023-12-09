import 'package:flutter/material.dart';

class DiffLine extends StatelessWidget {
  final String value;
  final String label;

  const DiffLine({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    double fontSizeMQ = MediaQuery.of(context).size.width * .1;
    double fontMinSize = 50;
    double fontMaxSize = 86;
    double fontSize = (fontSizeMQ > fontMaxSize)
        ? fontMaxSize
        : (fontSizeMQ < fontMinSize)
            ? fontMinSize
            : fontSizeMQ;
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            height: 0,
            color: const HSLColor.fromAHSL(1, 259, 1, .65).toColor(),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: fontSize, height: 0, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
