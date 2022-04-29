import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/screens/settings/membership_plan/membership.dart';
import 'package:load_connect_driver/view/screens/settings/security_screen.dart';
import 'package:load_connect_driver/view/screens/settings/tools_screen.dart';
import '../../../../shared/colors.dart';
import '../../settings/edit_profile.dart';

import '../../widgets/notification_icon.dart';
import '../../../utils/app_dialog.dart';
import '../../../utils/helper.dart';
import '../../../utils/custom_icons.dart';
import '../../others/about_screen.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _isSearching = useState(false);
    return NestedScrollView(
        // padding: const EdgeInsets.all(16.0),
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              title: Text("Settings"),
              actions: [
                NotificationIconWidget(),
              ],
            )
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(top: 16.0),
          children: [
            Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/icon.png"),
                  radius: 48.0,
                ),
                SizeMargin.size(height: 16.0),
                const Text(
                  "John Masserati",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizeMargin.size(height: 2.0),
                const Text(
                  "jdoemaserato@mailer.com",
                  style: TextStyle(color: AppColor.lightgrey),
                ),
                SizeMargin.size(height: 4.0),
                _getStarRatings()
              ],
            ),
            SizeMargin.size(height: 24.0.h),
            const Divider(),
            SizeMargin.size(height: 4.0.h),
            _itemTile(
              title: "Edit Business Profile",
              onTap: () {
                Get.to(EditProfileScreen());
              },
              icon: Icons.edit,
            ),
            _itemTile(
              title: "Saved Loads",
              onTap: () {
                Get.toNamed("/loads/saved");
              },
              icon: CustomIcons.box_1,
            ),
            _itemTile(
              title: "Recently viewed Loads",
              onTap: () {
                Get.toNamed("/loads/recent");
              },
              icon: CustomIcons.hourglass_full,
            ),
            _itemTile(
              title: "Tools",
              onTap: () {
                Get.to(const ToolsScreen());
              },
              icon: CustomIcons.calculate,
            ),
            _itemTile(
              title: "Membership & Plans",
              onTap: () {
                Get.to(const MembershipAndPlanScreen());
              },
              icon: CustomIcons.premium_1,
            ),
            _itemTile(
              title: "Notification Settings",
              onTap: () {
                Get.toNamed(Routes.notificationSettings);
              },
              icon: Icons.notifications,
            ),
            _itemTile(
              title: "Security & Password",
              onTap: () {
                Get.to(const SecurityScreen());
              },
              icon: Icons.lock,
            ),
            _itemTile(
              title: "About Load Connect",
              onTap: () {
                Get.to(const AboutScreen());
              },
              icon: CustomIcons.info,
            ),
            _itemTile(
              title: "Logout",
              onTap: () {
                AppDialog.mainDialog(
                  title: "Log Out?",
                  content: "This would log you out",
                  onTap: () {},
                  buttonColor: AppColor.error,
                  buttonText: "Yes, Logout",
                );
              },
              icon: CustomIcons.arrow_circle_left,
            ),
          ],
        ));
  }

  Widget _itemTile(
          {required String title,
          required IconData icon,
          GestureTapCallback? onTap}) =>
      ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: AppColor.primaryColor,
          size: 20.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blackgrey,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_outlined,
        ),
      );
  Widget _getStarRatings() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var _ in [1, 2, 3, 4])
          Icon(
            Icons.star_rounded,
            color: const Color(0XFFFFC000),
            size: 20.0.sp,
          ),
        Icon(
          Icons.star_half_rounded,
          color: const Color(0XFFFFC000),
          size: 20.0.sp,
        ),
      ],
    );
  }
}
