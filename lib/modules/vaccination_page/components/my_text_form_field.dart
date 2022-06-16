import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(
      {Key? key,
        this.lableText,
        required this.controller,
        this.keyboardType = TextInputType.text})
      : super(key: key);
  final String? lableText;
  TextInputType? keyboardType;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: lableText,
        //   hintText: 'Họ tên (ghi chữ in HOA)',
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
      ),
      // validator: validateText,
      controller: controller,
    );
  }
}
