import 'package:mobx/mobx.dart';

import '../models/post.dart';
import '../network/api/post_api.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  _PostStore(PostApi postApi) : _postApi = postApi;

  // #1
  late final PostApi _postApi;

  // #2
  // store variables:-----------------------------------------------------------
  @observable
  List<Post> posts = [];

  @observable
  bool isLoading = false;

  // for computed properties
  // @computed
  // int get total => left + right;

  // for readonly properties
  // @readonly
  // int youCantChangeMe = 0;

  // #3
  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    isLoading = true;
    final postList = await _postApi.getPosts();
    posts = postList;
    isLoading = false;
  }
}
