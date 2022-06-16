import 'package:flutter/material.dart';
import 'package:vncovid/modules/home_page/components/data_tracking/data_tracking.dart';
import 'package:vncovid/themes/app_assets.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import '../bottom_nav/bottom_nav.dart';
import '../my_drawer/my_drawer.dart';
import 'components/covid_map.dart';
import 'components/my_header/my_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller.dispose();
  //   super.dispose();
  // }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const MyDrawer(),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            MyHeader(
              image: AppAssets.Drcorona,
              textTop: "Đeo khẩu trang",
              textBottom: "trước khi ra khỏi nhà",
              onTap: ()  => _scaffoldKey.currentState!.openEndDrawer(),
            ),
            const DataTracking(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Bản đồ dịch bệnh",
                        style: AppStyle.kTitleTextStyle,
                      ),
                      Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const CovidMap(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 0,
      ),
    );
  }
}
