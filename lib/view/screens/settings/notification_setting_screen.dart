import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import '../../utils/helper.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

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
        title: const Text("Notification Settings"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16.0.h,
          horizontal: 16.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "All Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
            const Divider(),
            SizeMargin.size(height: 16.0),
            const Text(
              "Load Updates",
              style: TextStyle(
                color: AppColor.lightgrey,
              ),
            ),
            SizeMargin.size(height: 8.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Offer Recieved"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Offer Accepted"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Load Picked Up"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Load Delivered"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Delivery Errors"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            const Divider(),
            SizeMargin.size(height: 16.0),
            const Text(
              "Messages",
              style: TextStyle(
                color: AppColor.lightgrey,
              ),
            ),
            SizeMargin.size(height: 8.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("All Messages"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("From Active Loads only"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            const Divider(),
            SizeMargin.size(height: 16.0),
            const Text(
              "Others",
              style: TextStyle(
                color: AppColor.lightgrey,
              ),
            ),
            SizeMargin.size(height: 8.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("From Load Connect"),
              trailing: Switch(
                value: true,
                onChanged: (val) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  // final List<Map<String, String>> _itemList = const [
  //   {"title": "KYC Verification", "route": Routes.kyc},
  //   {"title": "Blocked List", "route": Routes.blockedList},
  //   {"title": "Change Password", "route": Routes.updatePassword},
  //   {"title": "Deactivate account", "route": Routes.deactivateAccount},
  // ];
}
