import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCalendarComponent extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextInputFormatter _numberFormatter =
      FilteringTextInputFormatter.digitsOnly;
  final Function validator;

  final TextEditingController controller;
  final Function(String)? onChanged;

  InputCalendarComponent(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.validator,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
            validator: (_) => (validator()) ? '' : null,
            keyboardType: TextInputType.number,
            inputFormatters: [_numberFormatter],
            onChanged: onChanged,
            decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 0),
                hintText: placeholder.toUpperCase(),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(10)))),
      ]),
    );
  }
}
