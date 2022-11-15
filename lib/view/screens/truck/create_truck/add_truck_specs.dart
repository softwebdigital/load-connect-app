import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect_driver/view/hooks/truck_hooks.dart';
import 'package:load_connect_driver/view/providers/user/create_truck_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../shared/colors.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/helper.dart';

class AddTruckSpecsScreen extends StatelessWidget {
  const AddTruckSpecsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<CreateTruckProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Truck Carriage Specifications",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2 out of 4",
              style: TextStyle(
                fontSize: 12.0,
                color: AppColor.white300,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: LinearPercentIndicator(
            width: width,
            animation: true,
            padding: EdgeInsets.zero,
            lineHeight: 10.0,
            animationDuration: 1000,
            percent: 0.5,
            backgroundColor: const Color(0XFFF2F2F2),
            progressColor: AppColor.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: [
            CustomTextFormField(
              label: "Truck Max Length (meters)",
              keyboardType: TextInputType.number,
              onSaved: (String? val) {
                provider.setTruckLength = val!;
              },
            ),
            SizeMargin.size(height: 20.0),
            CustomTextFormField(
              label: "Truck Max Weight (kilograms)",
              keyboardType: TextInputType.number,
              onSaved: (String? val) {
                provider.setTruckWeight = val!;
              },
            ),
            SizeMargin.size(height: 335.0.h),
            CustomRaisedButton(
              text: "Continue",
              onPressed: () {
                // Get.toNamed(Routes.addTruckImages);
                provider.next();
              },
            ),
            SizeMargin.size(height: 24.0),
            TextButton(
              onPressed: () {
                useCloseCreateTruck(context);
              },
              child: const Text("Cancel & Delete Truck"),
            )
          ],
        ),
      ),
    );
  }
}
