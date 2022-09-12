import 'package:flutter/material.dart';

import 'app_router.dart';
import 'di/locator.dart';
import 'screens/error_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MobX + GoRouter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      onGenerateRoute: (settings) => onGenerateAppRoute(settings),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ErrorScreen(),
      ),
    );
  }
}
