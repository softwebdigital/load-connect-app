import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_radio_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:load_connect/view/utils/regex_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:provider/provider.dart';

class AddLoadDetailsScreen extends StatelessWidget {
  const AddLoadDetailsScreen({Key? key}) : super(key: key);
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final createLoadProvider = Provider.of<CreateLoadProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What are you sending?",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2 out of 5",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
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
            percent: 0.4,
            backgroundColor: const Color(0XFFF2F2F2),
            progressColor: AppColor.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Load Name",
              onChanged: (String name) {
                createLoadProvider.loadName = name;
              },
            ),
            SizeMargin.size(height: 20.0),
            CustomTextField(
              label: "Load Description",
              onChanged: (String description) => createLoadProvider.loadDescription = description,
              minLines: 3,
              maxLines: 5,
              maxLength: 128,
            ),
            // SizeMargin.size(height: 20.0),
            // CustomTextFormField(
            //   controller: controller.destinationLocation,
            //   label: "Load Value(NGN)",
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // ),
            SizeMargin.size(height: 20.0),
            CustomTextFormField(
              onSaved: (value) {},
              label: "Load Weight(kg)",
              keyboardType: TextInputType.number,
              inputFormatters: [
                RegExInputFormatter.withRegex(
                  "^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$",
                )
              ],
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
              child: Column(
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
                        leading: Image.asset(
                          truckCategory['image']!,
                          width: 30.0,
                        ),
                        title: truckCategory['title']!,
                        subtitle: truckCategory['subtitle']!,
                        value: truckCategory['value']!,
                        groupValue: createLoadProvider.vehicleTypeId,
                        onChanged: (val) {
                          createLoadProvider.vehicleTypeId =
                              val ?? 'mini-truck';
                        },
                      ),
                    ))
                        .toList(),
                  ]),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Truck Capacity",
                      style: TextStyle(
                          fontSize: 12.0, color: AppColor.lightgrey),
                    ),
                    // SizeMargin.size(height: 16.0),
                    ..._truckCapacities
                        .map((truckCapacity) => Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomRadioButton<String>(
                        title: truckCapacity['title']!,
                        subtitle: truckCapacity['subtitle']!,
                        value: truckCapacity['value']!,
                        groupValue: createLoadProvider.capacity,
                        onChanged: (val) {
                          createLoadProvider.setVehicleCapacity =
                              val ?? 'heavy';
                        },
                      ),
                    ))
                        .toList(),
                  ]),
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Continue",
              onPressed: () {
                // Get.toNamed(Routes.addLoadImages);
                createLoadProvider.next();
              },
            ),
            SizeMargin.size(height: 24.0),
            TextButton(
              onPressed: () {
                useCloseCreateLoad(context);
              },
              child: const Text("Cancel & Delete Load"),
            )
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _truckCategories = const [
    {
      'title': 'Mini Truck',
      'subtitle': 'For items smaller than a crate of drinks for example',
      'image': 'assets/images/mini-truck.png',
      'value': 'mini-truck'
    },
    {
      'title': 'Pickup Truck',
      'subtitle': 'For items smaller than a petrol generator for example',
      'image': 'assets/images/truck.png',
      'value': 'pickup-truck'
    },
    {
      'title': 'Normal Truck',
      'subtitle': 'For items smaller than a petrol generator for example',
      'image': 'assets/images/delivery-truck.png',
      'value': 'normal-truck'
    },
    {
      'title': 'Large Truck',
      'subtitle': 'For extra large items that cannot fit into the others.',
      'image': 'assets/images/delivery-truck-2.png',
      'value': 'large-truck'
    }
  ];

  final List<Map<String, String>> _truckCapacities = const [
    {
      'title': 'Heavy',
      'subtitle': 'For items smaller than a crate of drinks for example',
      'value': 'heavy'
    },
    {
      'title': 'Big',
      'subtitle': 'For items smaller than a petrol generator for example',
      'value': 'big'
    },
    {
      'title': 'Small',
      'subtitle': 'For items smaller than a petrol generator for example',
      'value': 'small'
    },
    {
      'title': 'Light',
      'subtitle': 'For extra large items that cannot fit into the others.',
      'value': 'light'
    }
  ];
}
