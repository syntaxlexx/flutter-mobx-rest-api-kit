import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unicons/unicons.dart';

import '../../data/store/user_store.dart';
import '../../di/locator.dart';
import '../widgets/widgets.dart';
import 'view_user_screen.dart';

class UsersList extends StatelessWidget {
  final _store = getIt.get<UserStore>();

  UsersList({super.key}) {
    getUsers();
  }

  Future<void> getUsers() async {
    await _store.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          color: Colors.grey.shade200,
          child: ListView.builder(
            itemCount: _store.users.length,
            itemBuilder: (context, index) {
              final user = _store.users[index];
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ViewUserScreen.route, arguments: user),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Avatar(url: user.avatar ?? ''),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            '${user.firstName} ${user.lastName}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.group_rounded,
                              color: Colors.grey.shade500,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${user.followers}',
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          UniconsLine.angle_right,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
