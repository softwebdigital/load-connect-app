import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/providers/notification_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:load_connect/view/screens/settings/notification_setting_screen.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: const Text("Notification"), actions: [
        IconButton(
          onPressed: () async {
            // final result = await _sortLoads(context);
            // print(result);
          },
          icon: const Icon(
            Icons.mark_email_read_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.to(const NotificationSettingScreen());
          },
          icon: const Icon(
            Icons.settings_outlined,
          ),
        ),
      ]),
      body: notificationProvider.isLoading ? const Center(
        child: CircularProgressIndicator.adaptive()
      ) : notificationProvider.isLoaded ? ListView.builder(
          itemCount: notificationProvider.notifications.length,
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 16.0.w),
          itemBuilder: (_, index) {
            final notification = notificationProvider.notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 10.0,
              ),
              decoration: ShapeDecoration(
                color: AppColor.white200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 10.0,
                    backgroundColor: AppColor.deepGreen,
                    child: Icon(
                      Icons.check,
                      color: AppColor.white100,
                      size: 14.0,
                    ),
                  ),
                  SizeMargin.size(width: 6.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.data!.title!,
                          style: const TextStyle(
                            color: AppColor.deepGreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        SizeMargin.size(height: 6.0),
                        Text(
                          "${notification.data!.body}",
                          style: const TextStyle(
                            color: AppColor.blackgrey,
                          ),
                        ),
                        SizeMargin.size(height: 4.0),
                        Text(
                          "${notification.createdAt}",
                          style: TextStyle(
                            color: AppColor.black300.withOpacity(0.5),
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ) : Container(),
    );
  }
}
