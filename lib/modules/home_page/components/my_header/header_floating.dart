import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/app_assets.dart';
import '../../../../themes/app_styles.dart';

class HeaderFloating extends StatelessWidget {
  final String? textTop;
  final String? textBottom;
  final String? image;
  final GestureTapCallback onTap;
  const HeaderFloating({Key? key, this.textTop, this.textBottom, this.image,required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppAssets.menu),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              SvgPicture.asset(
                image!,
                width: 230,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                top: 20,
                left: 150,
                child: Text(
                  '$textTop\n$textBottom',
                  style:
                  AppStyle.kHeadingTextStyle.copyWith(color: Colors.white),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}

//'Đeo khẩu trang\ntrước khi ra khỏi nhà',AppAssets.Drcorona,
