import 'package:flutter/material.dart';

class AppColor {
  static const Color kBackgroundColor = Color(0xFFFEFEFE);
  static const Color kWhiteColor = Color(0xFFE2E7E1);
  static const Color kSignColor = Color(0xFFBABABA);
  static const Color transparent = Colors.transparent;
  static const Color kTitleTextColor = Color(0xFF303030);
  static const Color kBlackColor = Colors.black;
  static const Color kBodyTextColor = Color(0xFF4B4B4B);
  static const Color kTextLightColor = Color(0xFF959595);
  static const Color kInfectedColor = Color(0xFFFF8748);
  static const Color kDeathColor = Color(0xFFFF4848);
  static const Color kRecovercolor = Color(0xFF36C12C);
  static const Color kPrimaryColor = Color(0xFF3382CC);
  static final Color kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
  static final Color kActiveShadowColor =
      const Color(0xFF4056C6).withOpacity(.15);
  static const Color kBottomNavColor = Color(0xFF4056C6);
  static const LinearGradient backgroundGradient = LinearGradient(colors: [
    Color(0xFFE2E7E1),
    //Color(0xFF3383CD),
    Color(0xFFE2E7E1),
  ], begin: Alignment.topCenter, end: Alignment.bottomLeft);
}
