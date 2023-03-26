import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load_connect_driver/view/providers/user/create_truck_provider.dart';
import 'package:load_connect_driver/view/providers/utilities/truck_categories_provider.dart';
import 'package:load_connect_driver/view/providers/utilities/truck_type_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../shared/colors.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_radio_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../hooks/truck_hooks.dart';
import '../../../utils/helper.dart';

class AddTruckInfoScreen extends StatelessWidget {
  const AddTruckInfoScreen({Key? key}) : super(key: key);

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
            CustomTextFormField(
              label: "Truck Name",
              keyboardType: TextInputType.text,
              onSaved: (String? val) {
                provider.setTruckName = val!;
              },
              initialValue: provider.truckName,
            ),
            SizeMargin.size(height: 20.0),
            CustomTextFormField(
              label: "Truck Plate Number",
              onSaved: (String? val) {
                provider.setTruckPlateNumber = val!;
              },
              initialValue: provider.truckPlateNumber,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Truck Category",
                      style: TextStyle(
                          fontSize: 12.0, color: AppColor.lightgrey),
                    ),
                    // SizeMargin.size(height: 16.0),
                    ChangeNotifierProvider(
                      create: (context) => TruckCategoriesProvider(),
                      builder: (context, child) {
                        return Consumer<TruckCategoriesProvider>(
                          builder: (context, tcP, child) {
                            // provider.initialize();
                            if (tcP.isLoading) {
                              return const Text("Loading...");
                            }

                            if (tcP.isError) {
                              return Text(provider.message);
                            }

                            return Column(
                              children: [
                                ...tcP.truckCategories.map((truckCategory) => Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: CustomRadioButton<String>(
                                    leading: Image.network(
                                      "${truckCategory.avatar}",
                                      width: 30.0,
                                    ),
                                    title: truckCategory.title!,
                                    subtitle: truckCategory.description,
                                    value: truckCategory.id!.toString(),
                                    groupValue: provider.truckCategory,
                                    onChanged: (val) {
                                      provider.setTruckCategory = val.toString();
                                    },
                                  ),
                                )).toList(),
                              ],
                            );
                          },
                        );
                      },
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Truck Type",
                      style: TextStyle(fontSize: 12.0, color: AppColor.lightgrey),
                    ),
                    // SizeMargin.size(height: 16.0),
                    ChangeNotifierProvider(
                      create: (context) => TruckTypeProvider(),
                      builder: (context, child) {
                        return Consumer<TruckTypeProvider>(
                          builder: (context, tcP, child) {
                            // provider.initialize();
                            if (tcP.isLoading) {
                              return const Text("Loading...");
                            }

                            if (tcP.isError) {
                              return Text(provider.message);
                            }

                            return Column(
                              children: [
                                ...tcP.truckTypes.map((truckCategory) => Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: CustomRadioButton<String>(
                                    title: truckCategory.title!,
                                    subtitle: truckCategory.title!,
                                    value: truckCategory.id!.toString(),
                                    groupValue: provider.truckSubcategory,
                                    onChanged: (val) {
                                      provider.setTruckSubCategory = val.toString();
                                    },
                                  ),
                                )).toList(),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ]),
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Continue",
              onPressed: () {
                // Get.toNamed(Routes.addTruckSpecs);
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
