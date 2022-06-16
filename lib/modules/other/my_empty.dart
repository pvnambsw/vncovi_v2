import 'package:flutter/material.dart';

class MyEmpty extends StatelessWidget {
  const MyEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: const [
          Text('Rấc tiếc, không có gì tại đây!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}