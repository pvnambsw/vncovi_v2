import 'package:flutter/material.dart';

import '../modules/home_page/home_page.dart';

class RouterControl {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case 'InfoPage':
      //return MaterialPageRoute(builder: (context)=> const ());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
