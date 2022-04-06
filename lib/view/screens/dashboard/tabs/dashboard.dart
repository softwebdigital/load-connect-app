import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicons/unicons.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: kToolbarHeight.h,
            pinned: true,
            automaticallyImplyLeading: false,
            title: const Text("Dashboard"),
            actions: const [
              NotificationIconWidget(),
            ],
          ),
        ];
      },
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: _cardItem(
                    image: "assets/images/create-load.png",
                    title: "Create Load Now",
                    onTap: () {
                      Get.toNamed(Routes.selectLoadLocation);
                    },
                  ),
                ),
                SizeMargin.size(width: 14.0),
                Flexible(
                  child: _cardItem(
                    image: "assets/images/schedule-load.png",
                    title: "Schedule Load",
                    onTap: () {
                      Get.toNamed(Routes.selectLoadLocation);
                    },
                    color: AppColor.white100,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Text(
                "Recent Routes",
                style: TextStyle(
                  color: AppColor.lightgrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _recentRoute(),
            _recentRoute(),
            _recentRoute(),
            // SizeMargin.size(width: 14.0),
          ],
        ),
      ),
    );
  }

  Widget _cardItem(
      {required String title,
      required String image,
      GestureTapCallback? onTap,
      Color? color}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      radius: 30.0,
      // splashFactory: ,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: color ??
              const Color(
                0XFFFFF9E6,
              ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightgrey.withOpacity(.25),
              spreadRadius: 2.0,
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                image,
                width: 90.w,
              ),
            ),
            SizeMargin.size(height: 36.0.h),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recentRoute() {
    return Card(
      color: AppColor.white200,
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 12.0),
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "From",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizeMargin.size(height: 2.0),
            const Text(
              "Commercial Ave Sabo yaba, Lagos",
              style: TextStyle(
                // color: AppColor.lightgrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizeMargin.size(height: 6.0),
            const Text(
              "To",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizeMargin.size(height: 2.0),
            const Text(
              "Admirity Way, Lekki phase 1, Lagos",
              style: TextStyle(
                // color: AppColor.lightgrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizeMargin.size(height: 20.0.h),
            Row(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColor.white300,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColor.darkGreen,
                    ),
                  ),
                ),
                SizeMargin.size(width: 24.0),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColor.white300,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Icon(
                      UniconsLine.clock,
                      color: AppColor.darkGreen,
                    ),
                  ),
                ),
                SizeMargin.size(width: 24.0),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColor.white300,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Icon(
                      Icons.delete_outlined,
                      color: AppColor.darkGreen,
                    ),
                  ),
                ),
                SizeMargin.size(width: 24.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
