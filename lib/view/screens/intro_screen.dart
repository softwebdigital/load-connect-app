

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/services/core/i_local_storage.dart';
import 'package:load_connect_driver/shared/constants.dart';
import 'package:load_connect_driver/shared/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  void initialize() async {
    // final lastPage = GetStorage().read<Map<String, dynamic>?>("last_page");
    final isLoggedIn = await Get.find<ILocalStorageService>().getItem(userDataBox, userTokenKey, defaultValue: null);
    // if (lastPage != null) {
    //   return getLastPage(lastPage);
    // } else
    if (isLoggedIn != null) {
      Get.offAndToNamed(Routes.home);
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }


  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/images/splash.png"),
    );
  }
}
