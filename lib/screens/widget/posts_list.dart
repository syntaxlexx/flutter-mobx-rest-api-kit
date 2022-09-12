import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../app_routes.dart';
import '../../data/store/post_store.dart';
import '../../di/locator.dart';

class PostsList extends StatelessWidget {
  final _postStore = getIt.get<PostStore>();

  PostsList({super.key}) {
    getPosts();
  }

  Future<void> getPosts() async {
    await _postStore.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_postStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: _postStore.posts.length,
          itemBuilder: (context, index) {
            final post = _postStore.posts[index];
            return ListTile(
              title: Text(post.title ?? ''),
              subtitle: Text(post.body ?? ''),
              isThreeLine: false,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRoutes.ViewPost, arguments: post.id),
            );
          },
        );
      },
    );
  }
}
