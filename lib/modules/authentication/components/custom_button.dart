import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(color ?? Colors.indigoAccent),
            foregroundColor: MaterialStateProperty.all<Color>(
                textColor ?? AppColor.kWhiteColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)))),
      ),
    );
  }
}
