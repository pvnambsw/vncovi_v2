import 'package:flutter/material.dart';

class ListStep {
  static List<Step> getSteps() => [
    Step(
      title: Text('Thong tin chung'),
      content: Column(
        children: [
          TextFormField(
          ),
        ],
      ),
    ),
    Step(
        title: Text('Thong tin rieng'),
        content: Container(
          color: Colors.green,
        )),
  ];
}
