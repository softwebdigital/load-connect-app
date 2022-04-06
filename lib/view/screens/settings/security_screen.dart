import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text("Security & Password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0.w,
        ),
        child: Column(
          children: [
            for (var item in _itemList)
              ListTile(
                title: Text(
                  item['title']!,
                  style: const TextStyle(
                    color: AppColor.black300,
                  ),
                ),
                onTap: () {
                  Get.toNamed(item['route']!);
                },
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColor.black300,
                ),
              ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _itemList = const [
    {"title": "KYC Verification", "route": Routes.kyc},
    {"title": "Blocked List", "route": Routes.blockedList},
    {"title": "Change Password", "route": Routes.updatePassword},
    {"title": "Deactivate account", "route": Routes.deactivateAccount},
  ];
}
