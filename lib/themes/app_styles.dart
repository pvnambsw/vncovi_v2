import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  static const kTitleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: AppColor.kBottomNavColor,
      decoration: TextDecoration.none);

  static const kHeadingTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  static const kButtonTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const kSubTextStyle = TextStyle(
      fontSize: 16,
      color: AppColor.kTextLightColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static const kTitleTextStyle = TextStyle(
      fontSize: 18,
      color: AppColor.kTitleTextColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static const kBodyText = TextStyle(
      fontSize: 14,
      color: AppColor.kBlackColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);
}
