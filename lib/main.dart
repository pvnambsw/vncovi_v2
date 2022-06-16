import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vncovid/modules/firebase/firebase_initializer.dart';

import 'modules/bottom_nav/controller/nav_controller.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    FirebaseInitializer(
      child: MultiProvider(
        providers: [
          ListenableProvider<NavigationController>(
            create: (_) => NavigationController(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
