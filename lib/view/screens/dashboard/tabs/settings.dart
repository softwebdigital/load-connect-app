import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:load_connect/view/screens/settings/edit_profile.dart';
import 'package:load_connect/view/screens/settings/notification_setting_screen.dart';
import 'package:load_connect/view/screens/settings/recent_trucks.dart';
import 'package:load_connect/view/screens/settings/saved_trucks.dart';
import 'package:load_connect/view/screens/settings/security_screen.dart';
import 'package:load_connect/view/screens/settings/tools_screen.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/utils/app_dialog.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';
import '../../../utils/custom_icons_icons.dart';
import '../../others/about_screen.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<UserProfileProvider>(context);
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            toolbarHeight: kToolbarHeight.h,
            automaticallyImplyLeading: false,
            title: const Text("Settings"),
            actions: const [
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
              CircleAvatar(
                // child: Text("BR"),
                backgroundImage: profileProvider.user.profilePhoto == null
                    ? const AssetImage("assets/images/icon.png") as ImageProvider<Object>
                    : NetworkImage(profileProvider.user.profilePhoto!),
                radius: 48.0,
              ),
              SizeMargin.size(height: 16.0),
              Text(
                "${profileProvider.user.firstName!} ${profileProvider.user.lastName!}",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizeMargin.size(height: 2.0),
              Text(
                profileProvider.user.email ?? "",
                style: const TextStyle(color: AppColor.lightgrey),
              )
            ],
          ),
          SizeMargin.size(height: 30.0.h),
          const Divider(),
          SizeMargin.size(height: 4.0.h),
          _itemTile(
            title: "Edit Profile",
            onTap: () {
              Get.to(EditProfileScreen());
            },
            icon: Icons.edit,
          ),
          _itemTile(
            title: "Saved Trucks",
            onTap: () {
              Get.to(const SavedTrucksScreen());
            },
            icon: CustomIcons.cargo_truck_1,
          ),
          _itemTile(
            title: "Recently Viewed Trucks",
            onTap: () {
              Get.to(const RecentTrucksScreen());
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
            title: "Notification Settings",
            onTap: () {
              Get.to(const NotificationSettingScreen());
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
                onTap: () {
                  Get.offAllNamed(Routes.login);
                },
                buttonColor: AppColor.error,
                buttonText: "Yes, Logout",
              );
            },
            icon: CustomIcons.arrow_circle_left,
          ),
        ],
      ),
    );
  }

  Widget _itemTile(
          {required String title,
          required IconData icon,
          GestureTapCallback? onTap}) =>
      ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColor.primaryColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_outlined,
        ),
      );
}
