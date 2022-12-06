import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/view/utils/app_dialog.dart';
import 'package:provider/provider.dart';

import '../../../shared/colors.dart';
import '../../components/custom_appbar.dart';
import '../../providers/user/notification_provider.dart';
import '../../utils/helper.dart';
import '../settings/notification_setting_screen.dart';
import '../widgets/spacer_widget.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: const Text("Notification"), actions: [
        IconButton(
          onPressed: () async {
            notificationProvider.markAllNotificationAsRead();
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
      ) : notificationProvider.isError ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(notificationProvider.message, textAlign: TextAlign.center,),
          ColumnSpace(10),
          TextButton(onPressed: () {
            notificationProvider.initialize();
          }, child: const Text('refresh'))
        ],
      ) : notificationProvider.isLoaded ? notificationProvider.notifications.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("You do not have any notification yet", textAlign: TextAlign.center,),
          ColumnSpace(10),
          TextButton(onPressed: () {
            notificationProvider.initialize();
          }, child: const Text('refresh'))
        ],
      ) : ListView.builder(
          itemCount: notificationProvider.notifications.length,
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 16.0.w),
          itemBuilder: (_, index) {
            final notification = notificationProvider.notifications[index];
            return InkWell(
              onTap: () => notificationProvider.markNotificationAsRead(notification.id!),
              child: Container(
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
                            "${notification.data!.content}",
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
              ),
            );
          }
      ) : Container(),
    );
  }
}
