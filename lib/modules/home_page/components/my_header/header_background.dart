import 'package:flutter/material.dart';

import '../../../../themes/app_assets.dart';
import 'header_floating.dart';


class HeaderBackground extends StatelessWidget {
  final String? textTop;
  final String? textBottom;
  final String? image;
  final GestureTapCallback onTap;
  const HeaderBackground({Key? key,this.textTop,this.textBottom,this.image,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF3383CD),
          Color(0xFF11249F),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        image: DecorationImage(
          image: AssetImage(AppAssets.virus),
        ),
      ),
      child:  HeaderFloating(textTop: textTop,textBottom: textBottom,image: image,onTap: onTap,),
    );
  }
}
