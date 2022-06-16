import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_styles.dart';

class CounterCovid extends StatelessWidget {
  const CounterCovid({
    Key? key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);
  final int? number;
  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
    // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            //color: Colors.black.withOpacity(0.7),
            //blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: AppColor.kShadowColor.withOpacity(0.7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color!.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: color!,
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$number",
            style: TextStyle(
              fontSize: 35,
              color: color!,
                decoration: TextDecoration.none,
            ),
          ),
          Text(title!, style: AppStyle.kSubTextStyle),//
        ],
      ),
    );
  }
}
