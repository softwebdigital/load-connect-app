import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/utils/regex_input_formatter.dart';

import '../components/custom_textfield.dart';

class AppDialog {
  static mainDialog(
      {required String title,
      String? content,
      bool centerContent = false,
      Color? buttonColor,
      String? buttonText,
      String? cancelText,
      GestureTapCallback? onTap
      // List<Widget>? actions,
      }) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
        titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        actionsAlignment: MainAxisAlignment.center,
        titleTextStyle: const TextStyle(
          color: AppColor.deepGreen,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'CircularStd',
        ),
        contentTextStyle: const TextStyle(
          color: AppColor.lightgrey,
          fontFamily: 'CircularStd',
        ),
        title: Text(
          title,
          textAlign: centerContent ? TextAlign.center : TextAlign.start,
        ),
        content: content != null
            ? Text(
                content,
                textAlign: centerContent ? TextAlign.center : TextAlign.start,
              )
            : null,
        actions: [
          CustomRaisedButton(
            text: buttonText ?? "Continue",
            onPressed: onTap,
            backgroundColor: buttonColor ?? AppColor.darkGreen,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  cancelText ?? "No, cancel",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  static negotiateDialog({
        String? content,
        bool centerContent = false,
        Color? buttonColor,
        String? buttonText,
        String? cancelText,
        GestureTapCallback? onTap
        // List<Widget>? actions,
      }) async {
    final controller = TextEditingController();
    var price = "";
    return await Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
        titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        actionsAlignment: MainAxisAlignment.center,
        titleTextStyle: const TextStyle(
          color: AppColor.deepGreen,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'CircularStd',
        ),
        contentTextStyle: const TextStyle(
          color: AppColor.lightgrey,
          fontFamily: 'CircularStd',
        ),
        title: Text(
          "Send a new offer",
          textAlign: centerContent ? TextAlign.center : TextAlign.start,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter an amount that you would carry this load for", textAlign: centerContent ? TextAlign.center : TextAlign.start,),

            const SizedBox(height: 20,),

            CustomTextField(
              value: "",
              label: "Load value(₦)",
              keyboardType: TextInputType.number,
              inputFormatters: [
                RegExInputFormatter.withRegex(
                  "^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$",
                )
              ],
              controller: controller,
              onChanged: (val) {
                price = val;
              },
            )
          ],
        )
        ,
        actions: [
          CustomRaisedButton(
            text: "Send New Offer",
            onPressed: () {
              Get.back(result: price);
            },
            backgroundColor: buttonColor ?? AppColor.darkGreen,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  cancelText ?? "No, cancel",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
