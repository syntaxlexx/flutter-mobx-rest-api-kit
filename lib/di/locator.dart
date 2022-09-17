import 'package:get_it/get_it.dart';

import '../data/network/api/auth_api.dart';
import '../data/network/api/post_api.dart';
import '../data/network/api/user_api.dart';
import '../data/store/auth_store.dart';
import '../data/store/post_store.dart';
import '../data/store/user_store.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(PostApi());
  getIt.registerSingleton(PostStore(getIt.get<PostApi>()));

  getIt.registerSingleton(UserApi());
  getIt.registerSingleton(UserStore(getIt.get<UserApi>()));

  getIt.registerSingleton(AuthApi());
  getIt.registerSingleton(AuthStore(getIt.get<AuthApi>()));
}
