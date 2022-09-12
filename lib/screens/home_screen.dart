import 'package:flutter/material.dart';

import 'widget/posts_list.dart';
// import 'widget/users_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
            Center(
              child: Text('User List'),
            ),
            // UserList(),
          ],
        ),
      ),
    );
  }
}
