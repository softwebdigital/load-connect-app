import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../hooks/truck_hooks.dart';
import '../../../../core/repository/create_truck_controller.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/routes.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_radio_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/helper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../components/custom_appbar.dart';

class AddTruckInfoScreen extends GetView<CreateTruckController> {
  const AddTruckInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Truck Name and information",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "1 out of 4",
              style: TextStyle(
                fontSize: 12.0,
                color: AppColor.white300,
                // color: Colors.black.withOpacity(0.5),
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
            percent: 0.25,
            backgroundColor: const Color(0XFFF2F2F2),
            progressColor: AppColor.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: [
            const CustomTextFormField(
              label: "Truck Name",
              keyboardType: TextInputType.text,
            ),
            SizeMargin.size(height: 20.0),
            const CustomTextFormField(
              label: "Truck Plate Number",
            ),
            SizeMargin.size(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              decoration: ShapeDecoration(
                color: AppColor.white200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Obx(() {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Truck Category",
                        style: TextStyle(
                            fontSize: 12.0, color: AppColor.lightgrey),
                      ),
                      // SizeMargin.size(height: 16.0),
                      ..._truckCategories
                          .map((truckCategory) => Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: CustomRadioButton<String>(
                                  title: truckCategory['title']!,
                                  value: truckCategory['value']!,
                                  groupValue: controller.truckCategory.value,
                                  onChanged: (val) {
                                    controller.truckCategory.value =
                                        val ?? 'mini-truck';
                                  },
                                ),
                              ))
                          .toList(),
                    ]);
              }),
            ),
            SizeMargin.size(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              decoration: ShapeDecoration(
                color: AppColor.white200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Obx(() {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Truck Sub-category",
                        style: TextStyle(
                            fontSize: 12.0, color: AppColor.lightgrey),
                      ),
                      // SizeMargin.size(height: 16.0),
                      ..._truckSubCategories
                          .map((truckCapacity) => Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: CustomRadioButton<String>(
                                  title: truckCapacity['title']!,
                                  value: truckCapacity['value']!,
                                  groupValue: controller.truckCapacity.value,
                                  onChanged: (val) {
                                    controller.truckCapacity.value =
                                        val ?? 'heavy';
                                  },
                                ),
                              ))
                          .toList(),
                    ]);
              }),
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Continue",
              onPressed: () {
                Get.toNamed(Routes.addTruckSpecs);
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

  final List<Map<String, String>> _truckCategories = const [
    {'title': 'Mini Truck', 'value': 'mini-truck'},
    {'title': 'Pick-up Truck', 'value': 'pickup-truck'},
    {'title': 'Normal Truck', 'value': 'normal-truck'},
    {'title': 'Large Truck', 'value': 'large-truck'}
  ];
  final List<Map<String, String>> _truckSubCategories = const [
    {'title': 'Open Truck', 'value': 'open-truck'},
    {'title': 'Closed Truck', 'value': 'closed-truck'},
    {'title': 'Ice Truck', 'value': 'ice-truck'},
    {'title': '4 seater truck', 'value': '4-seater-truck'}
  ];
}
