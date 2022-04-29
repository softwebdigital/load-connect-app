import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect_driver/view/components/custom_appbar.dart';
import '../../utils/helper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("About Load Connect"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 56.0.h,
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 240.0.w,
              ),
            ),
            SizeMargin.size(height: 86.0.h),
            Text(
              "Load Connect",
              style: TextStyle(
                color: const Color(0XFF333333),
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizeMargin.size(height: 2.0),
            Text(
              "v1.00",
              style: TextStyle(
                color: const Color(0XFF333333).withOpacity(.5),
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizeMargin.size(height: 24.0),
            Text(
              "Gravida ullamcorper accumsan sed adipiscing sit. Diam dignissim in ut lectus sed semper augue proin. Aenean mauris nunc at augue vel.",
              style: TextStyle(
                color: const Color(0XFF333333).withOpacity(.5),
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizeMargin.size(height: 12.0.h),
            for (var button in buttonData) ...[
              TextButton(
                onPressed: () {},
                child: Text(button['title']!),
              ),
            ]
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> buttonData = const [
    {
      "title": "Privacy Policy",
      "link": "Privacy Policy",
    },
    {
      "title": "Terms & Conditions",
      "link": "Privacy Policy",
    },
    {
      "title": "Visit Website",
      "link": "Privacy Policy",
    },
    {
      "title": "FAQ",
      "link": "Privacy Policy",
    }
  ];
}
