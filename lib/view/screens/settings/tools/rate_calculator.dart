import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';

class RateCalculatorScreen extends StatefulHookWidget {
  const RateCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<RateCalculatorScreen> createState() => _RateCalculatorScreenState();
}

class _RateCalculatorScreenState extends State<RateCalculatorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final isValid = useState(false);
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
        title: const Text("Rate Calculator"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "Distance (km)",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "Rate",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "Other Cost",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                  SizeMargin.size(height: 24.h),
                  CustomRaisedButton(
                    text: "Calculate",
                    isBusy: isBusy.value,
                    onPressed: () {
                      isBusy.value = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        isBusy.value = false;
                        isValid.value = true;
                        snackBar(context, "Rating updated");
                      });
                    },
                  ),
                  SizeMargin.size(height: 36.h),
                  const Divider(),
                  SizeMargin.size(height: 16.h),
                  if (isValid.value) _rateCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rateCard() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        color: AppColor.white200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          _itemTile(
            "Rate per Kilometer is",
            "₦8,695",
          ),
          SizeMargin.size(height: 12.h),
          _itemTile(
            "Total Cost is",
            "₦8,000",
          ),
        ],
      ),
    );
  }

  Widget _itemTile(String title, String content) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 12.0, color: AppColor.lightgrey),
              ),
              SizeMargin.size(height: 4.0),
              Text(
                content,
                style:
                    const TextStyle(fontSize: 16.0, color: AppColor.blackgrey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
