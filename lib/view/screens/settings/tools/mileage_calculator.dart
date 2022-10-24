import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

class MileageCalculatorScreen extends StatelessWidget {
  const MileageCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Mileage calculator"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextField(
              label: "Pickup location",
              // controller: controller.pickUpLocation,
              value: "",
              readOnly: true,
            ),
            SizeMargin.size(height: 8.0),
            InkWell(
              onTap: () {
                // controller.swapLocations();
              },
              child: const CircleAvatar(
                backgroundColor: AppColor.darkGreen,
                child: Icon(
                  UniconsLine.refresh,
                  color: AppColor.white100,
                ),
              ),
            ),
            SizeMargin.size(height: 8.0),
            CustomTextField(
              // controller: controller.destinationLocation,
              label: "Destination",
              onTap: () {},
              readOnly: true,
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Calculate",
              onPressed: () {},
            ),
            SizeMargin.size(height: 36.h),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
