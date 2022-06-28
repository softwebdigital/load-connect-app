import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/address_result.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class SelectLoadLocationScreen extends StatelessWidget {
  const SelectLoadLocationScreen({Key? key}) : super(key: key);
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
              "Choose Pick Up and Destination",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "1 out of 5",
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
            percent: 0.2,
            // center: Text("80.0%"),
            // linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: const Color(0XFFF2F2F2),
            progressColor: AppColor.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Pickup location",
              onTap: () async {
                final loc = await Get.toNamed(
                  Routes.findPlace,
                  arguments: {
                    'page_title': "Pickup Location",
                  },
                );
                if (loc is AddressResult) {
                  consoleLog(
                    [loc.address, loc.name, loc.latitude, loc.longitude],
                  );
                  createLoadProvider.pickupAddress = loc.address;
                  createLoadProvider.pickupLat = loc.latitude;
                  createLoadProvider.pickupLng = loc.longitude;
                }
              },
              suffixIcon: IconButton(
                onPressed: () async {
                  final loc = await Get.toNamed(
                    Routes.openMaps,
                  );
                  if (loc is AddressResult) {
                    createLoadProvider.pickupAddress = loc.address;
                    createLoadProvider.pickupLat = loc.latitude;
                    createLoadProvider.pickupLng = loc.longitude;
                  }
                },
                icon: const Icon(
                  Icons.location_searching,
                  color: AppColor.primaryColor,
                ),
              ),
              readOnly: true,
            ),
            SizeMargin.size(height: 8.0),
            InkWell(
              onTap: () {
                createLoadProvider.swapLocation();
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
              label: "Destination",
              onTap: () async {
                final loc = await Get.toNamed(
                  Routes.findPlace,
                  arguments: {
                    'page_title': 'Destination',
                  },
                );
                if (loc is AddressResult) {
                  consoleLog(
                    [loc.address, loc.name, loc.latitude, loc.longitude],
                  );
                  createLoadProvider.destinationAddress = loc.address;
                  createLoadProvider.destinationLat = loc.latitude;
                  createLoadProvider.destinationLng = loc.longitude;
                }
              },
              readOnly: true,
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Continue",
              onPressed: () {
                // controller.pickUpLocation.text = "kkkk";
                // controller.destinationLocation.text = "oppp";
                // Get.toNamed(Routes.addLoadDetails);
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
}
