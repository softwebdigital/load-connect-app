import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/view/components/custom_radio_button.dart';
import '../../../../shared/colors.dart';
import '../../../components/custom_button.dart';
import '../../../utils/helper.dart';

class KycScreen extends HookWidget {
  const KycScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final documentType = useState("");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text("KYC Verification"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0.w,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  backgroundColor: AppColor.white200,
                  collapsedBackgroundColor: AppColor.white200,
                  title: const Text(
                    "Document Type",
                    style: TextStyle(color: AppColor.lightgrey),
                  ),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    // ExpansionPanelRadio(ex, body: null),

                    for (var item in _itemList)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          0.0,
                          16.0,
                          16.0,
                        ),
                        child: CustomRadioButton<String>(
                          title: item['title']!,
                          value: item['value']!,
                          groupValue: documentType.value,
                          onChanged: (val) {
                            documentType.value = val ?? "";
                          },
                        ),
                      )
                    // RadioListTile<String>(
                    //   // shape: const RoundedRectangleBorder(
                    //   //   side: BorderSide(
                    //   //     color: AppColor.black100,
                    //   //     width: 0.5,
                    //   //   ),
                    //   // ),
                    //   title: Text(item['title']!),
                    //   value: item['value']!,
                    //   groupValue: documentType.value,
                    //   onChanged: (val) {
                    //     documentType.value = val ?? "";
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
            SizeMargin.size(height: 36.0.h),
            TextButton(
              onPressed: documentType.value.isEmpty ? null : () {},
              child: const Text("Upload Document Image"),
            ),
            SizeMargin.size(height: 24.0.h),
            Text(
              "Each picture must not exceed 5 MB.",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontSize: 12.0.sp,
              ),
            ),
            SizeMargin.size(height: 8.0.h),
            Text(
              "Supported formats are .jpg and .png",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontSize: 12.0.sp,
              ),
            ),
            SizeMargin.size(height: 24.0.h),
            CustomRaisedButton(
              text: "Save Changes",
              isDisabled: documentType.value.isEmpty,
              isBusy: isBusy.value,
              onPressed: () {
                isBusy.value = true;
                Future.delayed(const Duration(seconds: 3), () {
                  isBusy.value = false;
                  snackBar(context, "Update failed, try again");
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _itemList = const [
    {"title": "International Passport", "value": "passport"},
    {"title": "Permanet Voter's Card (PVC)", "value": "pvc"},
    {"title": "Driver's License", "value": "driver-license"},
    {"title": "National Identification Number (NIN)", "value": "nin"},
  ];
}
