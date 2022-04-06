import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/core/repository/create_load_controller.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:load_connect/view/components/custom_appbar.dart';

class LoadReceiverInfoScreen extends GetView<CreateLoadController> {
  const LoadReceiverInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reciever's infomation",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "4 out of 5",
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
            percent: 0.8,
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
              label: "Receiver's name",
              controller: controller.receiverName,
            ),
            SizeMargin.size(height: 20.0),
            CustomTextField(
              controller: controller.receiverPhone,
              label: "Receiver's phone number",
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              isDisabled: isDisabled,
              text: "Continue",
              onPressed: () {
                Get.toNamed(Routes.otherLoadInfo);
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

  bool get isDisabled {
    // controller.receiverName.notifyListeners();
    final name = controller.receiverName.value.text;
    final phone = controller.receiverPhone.value.text;
    return name.isEmpty || phone.isEmpty;
  }
}
