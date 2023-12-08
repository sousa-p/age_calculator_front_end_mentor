import 'package:age_calculator_front_end_mentor/controllers/calendar_controller.dart';
import 'package:age_calculator_front_end_mentor/views/components/input_calendar_component.dart';
import 'package:flutter/material.dart';

class FormCalendarComponent extends StatefulWidget {
  final CalendarController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormCalendarComponent({super.key, required this.controller});

  @override
  State<FormCalendarComponent> createState() => _FormCalendarComponentState();
}

class _FormCalendarComponentState extends State<FormCalendarComponent> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              children: [
                InputCalendarComponent(
                    label: 'Day',
                    placeholder: 'dd',
                    validator: widget.controller.isInvalidDay,
                    controller: widget.controller.dayController,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.calendar.day =
                            int.tryParse(value) ?? 0;
                      });
                    }),
                InputCalendarComponent(
                    label: 'Month',
                    placeholder: 'mm',
                    validator: widget.controller.isInvalidMonth,
                    controller: widget.controller.monthController,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.calendar.month =
                            int.tryParse(value) ?? 0;
                      });
                    }),
                InputCalendarComponent(
                    label: 'Year',
                    placeholder: 'yy',
                    validator: widget.controller.isInvalidYear,
                    controller: widget.controller.yearController,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.calendar.year =
                            int.tryParse(value) ?? 0;
                      });
                    }),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print(widget._formKey.currentState!.validate()
                      ? 'Válido'
                      : 'Inválido');

                  print(widget.controller.calcDiff());
                },
                child: const Text('Calcular')),
          ],
        ));
  }
}
