import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vncovid/modules/authentication/login_phone_page.dart';
import 'package:vncovid/modules/home_page/home_page.dart';
import 'package:vncovid/route/route_name.dart';
import 'package:vncovid/themes/app_colors.dart';

import 'modules/bottom_nav/controller/nav_controller.dart';
import 'modules/declaration_page/declaration_page.dart';
import 'modules/infomation_page/information_page.dart';
import 'modules/vaccination_page/vaccination_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? page;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user();
  }

  user() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    print('Kiem tra user: ${user}');

    if (user != null) {
      //Đã đăng nhập
      page = const HomePage();
    } else {
      page = const LoginPhonePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vncovid',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.kBackgroundColor,
        fontFamily: "SourceSansPro",
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: AppColor.kBodyTextColor,
          ),
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: page!,
          ),
          if (navigation.screenName == RouteName.infoPage)
            MaterialPage(child: InformationPage()),
          // if (navigation.screenName == RouteName.qrPage)
          //   // const MaterialPage(child: QRPage()),
          if (navigation.screenName == RouteName.healthDeclarationPage)
            MaterialPage(child: DeclarationPage()),
          if (navigation.screenName == RouteName.vaccinationPage)
            MaterialPage(
              child: VaccinationPage(),
            ),
        ],
        onPopPage: (route, result) {
          bool popStatus = route.didPop(result);
          if (popStatus == true) {
            Provider.of<NavigationController>(context, listen: false)
                .changScreen(RouteName.homePage);
          }
          return popStatus;
        },
      ),
    );
  }
}
