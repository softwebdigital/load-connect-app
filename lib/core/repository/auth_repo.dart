import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './user_repo.dart';
import './helpers.dart';
import '../models/user.dart';
import '../models/request_result.dart';
import '../providers/auth.dart';
import '../providers/user.dart';

class AuthRepo extends GetxService {
  // declare providers here
  final AuthProvider _authProvider = AuthProvider();
  final UserProvider _userProvider = UserProvider();
  final _storage = GetStorage();
  final _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  // declare properties here
  final Rx<String> userToken = "".obs;

  bool get isLoggedIn =>
      userToken.value.isNotEmpty && userToken.value.length > 2;

  //   @override
  // void onInit() {
  //   super.onInit();
  // }

  // initial state
  Future<AuthRepo> init() async {
    debugPrint('$runtimeType fetching user token');
    final token = await _secureStorage.read(key: "user_key");
    if (token != null) {
      debugPrint('Saved user token:[$token]');
      userToken.value = token;
    }
    debugPrint('$runtimeType ready!');
    return this;
  }

  void clearLastPage() {
    _storage.remove("last_page");
  }

  // other methods
  Future<RequestResult> login(String email, String password) async {
    try {
      final httpResult = await _authProvider.loginUser(email, password);
      if (httpResult.status) {
        final data = httpResult.data as Map<String, dynamic>;
        final userRepo = Get.find<UserRepo>();
        userToken.value = data['token'];
        // save user data here
        final userHttpResult = await _userProvider.getUserProfile();
        userRepo.userData.value = User.fromMap(userHttpResult.data['user']);
        await _storage.write('user_data', userHttpResult.data['user']);
        await _secureStorage.write(key: "user_key", value: data['token']);
        // userRepo.userData.refresh();
        debugPrint("${userRepo.userData.value} - token: ${userToken.value}");
      }
      return parseHttpError(httpResult);
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<RequestResult> signup(Map<String, dynamic> data) async {
    try {
      final httpResult = await _authProvider.signupUser(data);
      if (httpResult.status) {
        // generate token here
        final data = httpResult.data as Map<String, dynamic>;
        await _authProvider.generateToken(data['id'], "register");
        _storage.write("last_page", {
          "page": "/registration-otp",
          "params": "?user_id=${data['id']}",
        });
        return RequestResult(httpResult.status, "${data['id']}");
      }
      return parseHttpError(httpResult);
    } catch (e) {
      rethrow;
    }
  }

  Future<RequestResult> verifyToken(
    String userId,
    String token, [
    bool fromreg = false,
  ]) async {
    try {
      final httpResult = await _authProvider.verifyToken(userId, token);
      if (httpResult.status) {
        final data = httpResult.data as Map<String, dynamic>;
        debugPrint("$data");
        if (fromreg) {
          _storage.remove("last_page");
        }
        return RequestResult(httpResult.status, httpResult.message);
      }
      return parseHttpError(httpResult);
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  void logout() async {
    userToken.value = "";
    await _storage.remove('user_data');
    await _secureStorage.delete(key: "user_key");
  }
}
