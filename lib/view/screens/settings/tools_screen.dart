import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import './tools/mileage_calculator.dart';
import './tools/rate_calculator.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

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
        title: const Text("Tools"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16.0.h,
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Get.to(_getPage(item['route']!));
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
    {"title": "Rate Calculator", "route": "rate"},
    {"title": "Milage calculator", "route": "mileage"},
  ];
  Widget _getPage(String route) {
    if (route == 'rate') {
      return const RateCalculatorScreen();
    }
    return const MileageCalculatorScreen();
  }
}
