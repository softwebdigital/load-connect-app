import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/routes.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Positioned(
            top: 16.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundColor: AppColor.error,
              radius: 3.0,
            ),
          )
        ],
      ),
    );
  }
}
