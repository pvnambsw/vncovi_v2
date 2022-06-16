import 'package:flutter/material.dart';

import '../../../route/route_name.dart';

class NavigationController with ChangeNotifier {
  String _screenName = RouteName.homePage;

  String get screenName => _screenName;

  void changScreen(String newScreenName) {
    _screenName = newScreenName;
    notifyListeners();
  }
}