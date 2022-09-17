import 'package:mobx/mobx.dart';

import '../models/auth.dart';
import '../network/api/auth_api.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore(AuthApi api) : _api = api;

  late final AuthApi _api;

  @observable
  Auth? auth;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @computed
  bool get isLoggedIn => auth != null && auth!.token != null;

  @action
  Future login(username, password) async {
    isLoading = true;
    final res = await _api.login(username, password);
    auth = res;
    isLoading = false;
  }
}
