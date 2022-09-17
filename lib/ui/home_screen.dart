import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'auth/login_screen.dart';
import 'posts/posts_list.dart';
import 'users/users_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX API Demo'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, LoginScreen.route),
            icon: const Icon(UniconsLine.user),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Posts',
            ),
            Tab(
              text: 'Users',
            )
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            PostsList(),
            UsersList(),
          ],
        ),
      ),
    );
  }
}
