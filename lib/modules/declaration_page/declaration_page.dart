import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncovid/modules/declaration_page/components/declaration.dart';

import '../../themes/app_assets.dart';
import '../bottom_nav/bottom_nav.dart';
import '../my_drawer/my_drawer.dart';

class DeclarationPage extends StatelessWidget {
  DeclarationPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Khai báo y tế'),
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
        child: const Declaration(),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 3,
      ),
    );
  }
}
