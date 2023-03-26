import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:load_connect_driver/view/providers/go_live_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/colors.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_button.dart';
import '../../components/custom_radio_button.dart';
// import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class TruckGoLiveScreen extends StatelessWidget {
  const TruckGoLiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final location = useState("near-me");
    // final availability = useState("immediate");
    // final capacity = useState("full-truck-load");
    return Scaffold(
      appBar: const CustomAppBar(
        height: 12.0,
        title: Text(
          "Go Live",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => GoLiveProvider(),
        builder: (context, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Column(
              children: [
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
                        "Location",
                        style: TextStyle(fontSize: 12.0, color: AppColor.lightgrey),
                      ),
                      // SizeMargin.size(height: 16.0),
                      ..._locations
                          .map((loc) => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CustomRadioButton<String>(
                          title: loc['title']!,
                          value: loc['value']!,
                          groupValue: context.read<GoLiveProvider>().goLiveLocation,
                          onChanged: (val) {
                            context.read<GoLiveProvider>().setGoLiveLocation = val ?? 'near-me';
                          },
                        ),
                      ))
                          .toList(),
                    ],
                  ),
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
                        "Date of Availability",
                        style: TextStyle(fontSize: 12.0, color: AppColor.lightgrey),
                      ),
                      // SizeMargin.size(height: 16.0),
                      ..._availability
                          .map((avai) => Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CustomRadioButton<String>(
                            title: avai['title']!,
                            value: avai['value']!,
                            groupValue: context.read<GoLiveProvider>().availability,
                            onChanged: (val) async {
                              if (val != 'immediate') {
                                final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 10)));
                                if (date != null) {
                                  context.read<GoLiveProvider>().setDateAvailability = date.toString();
                                  context.read<GoLiveProvider>().setAvailability = val ?? 'immediate';
                                }
                              } else {
                                context.read<GoLiveProvider>().setDateAvailability = DateTime.now().toString();
                                context.read<GoLiveProvider>().setAvailability = val ?? 'immediate';
                              }

                            },
                          ),
                        ),
                      ).toList(),
                    ],
                  ),
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
                        "Avaliable Capacity",
                        style: TextStyle(fontSize: 12.0, color: AppColor.lightgrey),
                      ),
                      // SizeMargin.size(height: 16.0),
                      ..._capacity.map((capcty) => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CustomRadioButton<String>(
                          title: capcty['title']!,
                          value: capcty['value']!,
                          groupValue: context.read<GoLiveProvider>().capacity,
                          onChanged: (val) {
                            context.read<GoLiveProvider>().setCapacity = val ?? 'immediate';
                          },
                        ),
                      ))
                          .toList(),
                    ],
                  ),
                ),
                SizeMargin.size(height: 24.0),
                CustomRaisedButton(
                  text: "Go Live",
                  onPressed: () => context.read<GoLiveProvider>().goLive(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  final List<Map<String, String>> _locations = const [
    {'title': 'Near me', 'value': 'near-me'},
    {'title': 'Choose State', 'value': 'choose-state'},
  ];
  final List<Map<String, String>> _availability = const [
    {'title': 'Immediate', 'value': 'immediate'},
    {'title': 'Schedule', 'value': 'schedule'},
  ];
  final List<Map<String, String>> _capacity = const [
    {'title': 'Full Truck Load', 'value': 'full-truck-load'},
    {'title': 'Less Than Truck Load', 'value': 'less-truck-load'},
  ];
}
