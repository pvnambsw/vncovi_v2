import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';



class CovidMap extends StatelessWidget {
  const CovidMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      height: 178,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 30,
            color: AppColor.kShadowColor,
          ),
        ],
      ),
      child: Image.asset(
        "assets/images/map.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
