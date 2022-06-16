import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../themes/app_assets.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import 'components/custom_button.dart';
import 'otp_page.dart';

class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({Key? key}) : super(key: key);

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  String dialCodeDigits = "+84";
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        Container(
          height: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.virus),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Vui lòng nhập số điện thoại để ',
                          style: AppStyle.kSubTextStyle.copyWith(
                            color: AppColor.kBackgroundColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'đăng ký/đăng nhập ',
                                style: AppStyle.kSubTextStyle.copyWith(
                                    color: AppColor.kSignColor)),
                            TextSpan(
                                text: 'ứng dụng VNCOVI',
                                style: AppStyle.kSubTextStyle.copyWith(
                                    color: AppColor.kBackgroundColor)),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    width: 350,
                    height: 55,
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (country) {
                            setState(() {
                              dialCodeDigits = country.dialCode!;
                            });
                          },
                          initialSelection: "Việt Nam",
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          favorite: const ["VN"],
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Số điện thoại",
                            ),
                            keyboardType: TextInputType.number,
                            // maxLength: 13,
                            controller: phoneController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTPPage(
                              codeDigits: dialCodeDigits,
                              phone: phoneController.text,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Tiếp tục',
                        style: AppStyle.kButtonTextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
