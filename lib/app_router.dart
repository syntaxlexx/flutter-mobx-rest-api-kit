import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'data/models/post.dart';
import 'data/models/user.dart';
import 'ui/error_screen.dart';
import 'ui/home_screen.dart';
import 'ui/posts/view_post_screen.dart';
import 'ui/users/view_user_screen.dart';

// static routes
final appRoutes = {
  HomeScreen.route: (context) => const HomeScreen(),
  ErrorScreen.route: (context) => const ErrorScreen(),
};

// define routes with animations and arguments
Route<dynamic>? onGenerateAppRoute(settings) {
  switch (settings.name) {
    case ViewPostScreen.route:
      final post = settings.arguments;
      if (post == null || post is! Post) return null;
      return PageTransition(
        child: ViewPostScreen(
          post: post,
        ),
        type: PageTransitionType.scale,
        alignment: Alignment.centerLeft,
      );
    case ViewUserScreen.route:
      final user = settings.arguments;
      if (user == null || user is! User) return null;
      return PageTransition(
        child: ViewUserScreen(
          user: user,
        ),
        type: PageTransitionType.scale,
        alignment: Alignment.centerLeft,
      );
    default:
      return null;
  }
}
