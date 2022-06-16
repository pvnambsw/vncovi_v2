import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../route/route_name.dart';
import '../../themes/app_colors.dart';
import 'controller/nav_controller.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, this.activeButtonIndex = 0}) : super(key: key);
  final int activeButtonIndex;

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
    Provider.of<NavigationController>(context, listen: false);
    return BottomNavigationBar(
      currentIndex: activeButtonIndex,
      onTap: (buttonIndex) {
        switch (buttonIndex) {
          case 0:
            navigationController.changScreen(RouteName.homePage);
            break;
          case 1:
            navigationController.changScreen(RouteName.infoPage);
            break;
          case 2:
            navigationController.changScreen(RouteName.qrPage);
            break;
          case 3:
            navigationController.changScreen(RouteName.healthDeclarationPage);
            break;
          case 4:
            navigationController.changScreen(RouteName.vaccinationPage);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            backgroundColor: AppColor.kBottomNavColor,
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.health_and_safety,
            ),
            backgroundColor: AppColor.kBottomNavColor,
            label: 'Thông tin'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
            ),
            backgroundColor: AppColor.kBottomNavColor,
            label: 'Quét QR'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_drive_file_outlined,
            ),
            backgroundColor: AppColor.kBottomNavColor,
            label: 'Khai báo'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.app_registration,
            ),
            backgroundColor: AppColor.kBottomNavColor,
            label: 'Tiêm Vaccine'),
      ],
    );
  }
}