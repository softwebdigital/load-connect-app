import 'package:flutter/material.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LoadReceiverInfoScreen extends StatelessWidget {
  const LoadReceiverInfoScreen({Key? key}) : super(key: key);

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
              onChanged: (String name) {
                createLoadProvider.receiverName = name;
              },
              value: createLoadProvider.receiverName,
            ),
            SizeMargin.size(height: 20.0),
            CustomTextField(
              onChanged: (String phone) {
                createLoadProvider.setReceiverPhoneNumber = phone;
              },
              label: "Receiver's phone number",
              value: createLoadProvider.receiverPhoneNumber,
              keyboardType: TextInputType.number,
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              isDisabled: false,
              text: "Continue",
              onPressed: () {
                // Get.toNamed(Routes.otherLoadInfo);
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

  // bool get isDisabled {
  //   // controller.receiverName.notifyListeners();
  //   final name = createLoadProvider;
  //   final phone = controller.receiverPhone.value.text;
  //   return name.isEmpty || phone.isEmpty;
  // }
}
