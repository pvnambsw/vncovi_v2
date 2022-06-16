import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTextFormFieldDay extends StatefulWidget {
  MyTextFormFieldDay({Key? key, this.lableText, required this.dobController})
      : super(key: key);
  final String? lableText;
  TextEditingController dobController = TextEditingController();

  @override
  _MyTextFormFieldDayState createState() => _MyTextFormFieldDayState();
}

class _MyTextFormFieldDayState extends State<MyTextFormFieldDay> {
  DateFormat? _dateFormat;
  DateTime? _selectedDate;

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      widget.dobController.text = _dateFormat!.format(_selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          labelText: widget.lableText,
          hintText: 'DD/MM/YYYY',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
            gapPadding: 5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
            gapPadding: 5,
          ),
          suffixIcon: const Icon(Icons.date_range)),
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then((selectedDate) {
          if (selectedDate != null) {
            widget.dobController.text =
                DateFormat('dd/MM/yyyy').format(selectedDate);
          }
        });
      },
      // validator: validateText,
      controller: widget.dobController,
    );
  }
}
