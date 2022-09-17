import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../data/store/post_store.dart';
import '../../di/locator.dart';
import '../widgets/widgets.dart';
import 'view_post_screen.dart';

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
    final width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (context) {
        if (_postStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          color: Colors.grey.shade100,
          child: ListView.builder(
            itemCount: _postStore.posts.length,
            itemBuilder: (context, index) {
              final post = _postStore.posts[index];
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ViewPostScreen.route, arguments: post),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.35,
                          height: 110,
                          child: CachedImage(
                            url: post.image ?? '',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const Divider(),
                                Text(
                                  post.body ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  softWrap: true,
                                )
                              ],
                            ),
                          ),
                        ),
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
