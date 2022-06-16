import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  const MyError({Key? key, this.message}) : super(key: key);

  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(message ?? 'Rấc tiếc, đã xảy ra lỗi!',
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}