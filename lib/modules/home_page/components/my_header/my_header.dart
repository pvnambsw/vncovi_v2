import 'package:flutter/material.dart';

import 'header_background.dart';
import 'my_clipper.dart';

class MyHeader extends StatelessWidget {
  final String? textTop;
  final String? textBottom;
  final String? image;
  final GestureTapCallback onTap;
  const MyHeader({Key? key, this.textTop, this.textBottom, this.image,required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: HeaderBackground(
        textTop: textTop,
        textBottom: textBottom,
        image: image,
        onTap: onTap,
      ),
    );
  }
}