import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<UserProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.notifications);
            },
            icon: Icon(
              Icons.notifications,
              size: 26.0.h,
            ),
          ),
          profileProvider.isLoaded ? const Positioned(
            top: 16.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundColor: AppColor.yellow,
              // backgroundColor: profileProvider.profile!.unreadNotifications!.isNotEmpty ? AppColor.yellow : Colors.transparent,
              radius: 3.0,
            ),
          ) : const SizedBox()
        ],
      ),
    );
  }
}
