import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../data/models/user.dart';
import '../widgets/widgets.dart';

class ViewUserScreen extends StatelessWidget {
  static const route = '/users/show';

  User user;
  int? id;
  double space = 0.3;

  ViewUserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: false,
                pinned: true,
                snap: false,
                elevation: 1,
                // backgroundColor: Theme.of(context).primaryColor,
                expandedHeight: size.height * (space + 0.05),
                // title: Text('View Post #${post!.id}'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: const [
                  Icon(Icons.favorite),
                  SizedBox(
                    width: 12,
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedImage(url: user.avatar ?? ''),
                  title: Text('User #${user.id}'),
                  centerTitle: true,
                ),
              ),
            ];
          },
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Theme.of(context).backgroundColor,
            child: ListView(
              children: [
                Divider(
                  thickness: 2,
                  indent: size.width * 0.3,
                  endIndent: size.width * 0.3,
                  color: Colors.grey.shade300,
                  height: 3, // The divider's height extent.
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(),
                Text(
                  'Followers: ${user.followers}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Email: ${user.email}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          label: const Text('Share'),
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
      );
    });
  }
}
