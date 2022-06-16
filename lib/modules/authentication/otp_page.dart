import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vncovid/modules/authentication/components/custom_button.dart';

import '../../repository/account_repo.dart';
import '../../themes/app_assets.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import '../home_page/home_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key, required this.phone, required this.codeDigits})
      : super(key: key);
  final String phone;
  final String codeDigits;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPController = TextEditingController();
  final pinputFocusNode = FocusNode();
  String? varificationCode;
  late bool isActiveVerification;

  final BoxDecoration pinOTPDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 25,
      color: AppColor.kPrimaryColor,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 25,
      color: AppColor.kPrimaryColor,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final submittedPinTheme = const PinTheme(
    width: 50,
    height: 50,
    textStyle: TextStyle(
      fontSize: 25,
      color: AppColor.kPrimaryColor,
    ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
    isActiveVerification = false;
  }

  String? myUid;
  String? myPhone;

//String? token;
  verifyPhoneNumber() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    //print('Token user: $token ${token.runtimeType}');
    await auth.verifyPhoneNumber(
      phoneNumber: '${widget.codeDigits + widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
              myUid = value.user!.uid;
              myPhone = value.user!.phoneNumber;
              print('uid nè $myUid');
              print('phone nè $myPhone');
          if (value.user != null) {
            print('value nè $value');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        });
        await AccountRepo()
            .postAccountData(myUid!, myPhone!)
            .then((value) => print(value));
      },
      verificationFailed: (FirebaseException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
            duration: const Duration(seconds: 3),
          ),
        );
      },
      codeSent: (String vID, int? resentToken) {
        setState(() {
          varificationCode = vID;
        });
        print('vID user: $vID');
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          varificationCode = vID;
        });
      },
      timeout: const Duration(
        seconds: 60,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0, //bỏ shadow
          backgroundColor: Colors.transparent,
          title: const Text(
            'Xác thực số điện thoại',
            style: AppStyle.kHeadingTextStyle,
          ),
        ),
        extendBodyBehindAppBar: true,
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
                        height: 190,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Chúng tôi đã gửi SMS đến số điện thoại của bạn',
                            style: AppStyle.kSubTextStyle.copyWith(
                              color: AppColor.kBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '${widget.phone}',
                            style: AppStyle.kSubTextStyle.copyWith(
                              color: AppColor.kSignColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          focusNode: pinputFocusNode,
                          pinputAutovalidateMode:
                          PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,
                          onSubmitted: (pin) async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                PhoneAuthProvider.credential(
                                    verificationId: varificationCode!,
                                    smsCode: pin),
                              )
                                  .then((value) {
                                if (value.user != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
                              });
                              await AccountRepo()
                                  .postAccountData(myUid!, myPhone!)
                                  .then((value) => print(value));
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('OTP không hợp lệ'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyElevatedButton(
                          onPressed: () {
                            setState(() {
                              isActiveVerification = true;
                            });
                          },
                          child: Text(
                            'Xác thực',
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
