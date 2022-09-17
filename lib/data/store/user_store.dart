import 'package:mobx/mobx.dart';

import '../models/user.dart';
import '../network/api/user_api.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore(UserApi userApi) : _userApi = userApi;

  // #1
  late final UserApi _userApi;

  // #2
  // store variables:-----------------------------------------------------------
  @observable
  List<User> users = [];

  @observable
  bool isLoading = false;

  // for computed properties
  // @computed
  // int get fullName => left + right;

  // for readonly properties
  // @readonly
  // int youCantChangeMe = 0;

  // #3
  // actions:-------------------------------------------------------------------
  @action
  Future getUsers() async {
    isLoading = true;
    final list = await _userApi.getUsers();
    users = list;
    isLoading = false;
  }
}
