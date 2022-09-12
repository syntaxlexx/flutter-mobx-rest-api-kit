import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'app_routes.dart';
import 'screens/error_page.dart';
import 'screens/home_screen.dart';
import 'screens/view_post_screen.dart';

// static routes
final appRoutes = {
  AppRoutes.Home: (context) => const HomeScreen(),
  AppRoutes.Error: (context) => const ErrorScreen(),
};

// define routes with animations and arguments
Route<dynamic>? onGenerateAppRoute(settings) {
  switch (settings.name) {
    case AppRoutes.ViewPost:
      final id = settings.arguments;
      if (id == null || id.toString().isEmpty) return null;
      return PageTransition(
          child: ViewPostScreen(
            id: int.parse(id.toString()),
          ),
          type: PageTransitionType.rightToLeft);
    default:
      return null;
  }
}
