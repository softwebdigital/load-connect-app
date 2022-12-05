import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load_connect/backend/models/entities/vehicle_type_model.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_radio_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/providers/utilities/vehicle_type_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:load_connect/view/utils/regex_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AddLoadDetailsScreen extends StatelessWidget {
  AddLoadDetailsScreen({Key? key}) : super(key: key);
  // final TextEditingController _controller = TextEditingController();


  // List<VehicleTypeModel> truckCategories = [
  //   VehicleTypeModel(
  //     name: "Mini Truck",
  //     icon: "assets/images/mini-truck.png", id: 1,
  //     description: "For items smaller than a crate of drinks for example"
  //   ),
  //   VehicleTypeModel(
  //     name: "Pickup Truck",
  //     icon: "assets/images/delivery-truck.png", id: 2,
  //     description: "For items smaller than a petrol generator for example"
  //   ),
  //   VehicleTypeModel(
  //       name: "Normal Truck",
  //       icon: "assets/images/truck.png", id: 3,
  //       description: "For items smaller than a petrol generator for example"
  //   ),
  //   VehicleTypeModel(
  //       name: "Large Truck",
  //       icon: "assets/images/delivery-truck-2.png", id: 4,
  //       description: "For items smaller than a petrol generator for example"
  //   ),
  // ];

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
              value: createLoadProvider.loadName,
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
              value: createLoadProvider.loadDescription,
            ),
            // SizeMargin.size(height: 20.0),
            // CustomTextFormField(
            //   controller: controller.destinationLocation,
            //   label: "Load Value(NGN)",
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // ),
            SizeMargin.size(height: 20.0),
            CustomTextField(
              value: createLoadProvider.loadValue,
              onChanged: (String value) {
                createLoadProvider.loadValue = value;
              },
              label: "Load value(₦)",
              keyboardType: TextInputType.number,
              inputFormatters: [
                RegExInputFormatter.withRegex(
                  "^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$",
                )
              ],
            ),
            SizeMargin.size(height: 20.0),
            CustomTextField(
              value: createLoadProvider.loadWeight,
              onChanged: (String weight) {
                createLoadProvider.loadWeight = weight;
              },
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Truck Category",
                      style: TextStyle(
                          fontSize: 12.0, color: AppColor.lightgrey),
                    ),
                    // SizeMargin.size(height: 16.0),
                    ChangeNotifierProvider(
                      create: (context) => VehicleTypeProvider(),
                      builder: (context, child) {
                        return Consumer<VehicleTypeProvider>(
                          builder: (context, provider, child) {
                            // provider.initialize();
                            if (provider.isLoading) {
                              return Text("Loading...");
                            }

                            if (provider.isError) {
                              return Text("${provider.message}");
                            }

                            return Column(
                              children: [
                                ...provider.vehicleTypes.map((truckCategory) => Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: CustomRadioButton<String>(
                                    leading: Image.network(
                                      truckCategory.avatar!,
                                      width: 30.0,
                                    ),
                                    title: truckCategory.title!,
                                    subtitle: truckCategory.description,
                                    value: truckCategory.id!.toString(),
                                    groupValue: createLoadProvider.vehicleTypeId,
                                    onChanged: (val) {
                                      createLoadProvider.setVehicleTypeId = val.toString();
                                    },
                                  ),
                                )).toList(),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    // Column(
                    //   children: [
                    //     ...truckCategories.map((truckCategory) => Padding(
                    //       padding: const EdgeInsets.only(top: 16.0),
                    //       child: CustomRadioButton<String>(
                    //         leading: Image.asset(
                    //           truckCategory.icon!,
                    //           width: 30.0,
                    //         ),
                    //         title: truckCategory.name!,
                    //         subtitle: truckCategory.description,
                    //         value: truckCategory.name!.toString(),
                    //         groupValue: createLoadProvider.vehicleTypeId,
                    //         onChanged: (val) {
                    //           createLoadProvider.setVehicleTypeId = val.toString();
                    //         },
                    //       ),
                    //     )).toList(),
                    //   ],
                    // )
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
      'title': 'Full',
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
