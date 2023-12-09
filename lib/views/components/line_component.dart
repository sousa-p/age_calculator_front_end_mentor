import 'package:flutter/material.dart';

class LineComponent extends StatelessWidget {
  final double width;
  const LineComponent({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        SizedBox(
            width: width,
            height: 1,
            child: const ColoredBox(color: Colors.black38)),
      ],
    );
  }
}
