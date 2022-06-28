import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load_connect/backend/repositories/api/service_implementation/api_auth_service.dart';
import 'package:load_connect/backend/repositories/api/service_implementation/user_service.dart';
import 'package:load_connect/backend/repositories/core/hive_local_storage.dart';
import 'package:load_connect/backend/repositories/util_repo.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/backend/services/i_user_service.dart';

Future<void> setupServiceLocator() async {
  await GetStorage.init();
  Get.put<UtilRepo>(UtilRepo());
  Get.put<ILocalStorageService>(HiveLocalStorageService());
  Get.put<IAuthService>(ApiAuthService());
  Get.put<IUserService>(UserService());
  // await Get.putAsync(() => UserRepo()).init();
  debugPrint('All services started...');
}
