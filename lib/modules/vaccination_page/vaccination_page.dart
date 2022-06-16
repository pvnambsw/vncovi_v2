import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/app_assets.dart';
import '../bottom_nav/bottom_nav.dart';
import '../my_drawer/my_drawer.dart';
import 'components/vaccine_widget.dart';

class VaccinationPage extends StatelessWidget {
  VaccinationPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Đăng ký tiêm Vaccine'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
              child: SvgPicture.asset(AppAssets.menu),
              onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const MyDrawer(),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.indigoAccent),
        ),
        child: const VaccineWidget(),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 4,
      ),
    );
  }
}
