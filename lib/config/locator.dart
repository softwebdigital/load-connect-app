import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load_connect/core/repository/auth_repo.dart';
import 'package:load_connect/core/repository/user_repo.dart';
import 'package:load_connect/core/repository/util_repo.dart';

Future<void> setupServiceLocator() async {
  await GetStorage.init();
  await Get.putAsync<UtilRepo>(() => UtilRepo().init());
  await Get.putAsync<AuthRepo>(() => AuthRepo().init());
  await Get.putAsync<UserRepo>(() => UserRepo().init());
  // await Get.putAsync(() => UserRepo()).init();
  debugPrint('All services started...');
}
