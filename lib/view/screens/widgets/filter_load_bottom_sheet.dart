import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect_driver/shared/colors.dart';
import 'package:load_connect_driver/view/components/custom_button.dart';
import 'package:load_connect_driver/view/utils/helper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'custom_chip.dart';

class FilterLoadBottomSheet extends HookWidget {
  const FilterLoadBottomSheet({Key? key, required this.ctx}) : super(key: key);
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final _sliderValue = useState(const SfRangeValues(1000.0, 8000.0));
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.filter_alt, color: AppColor.lightgrey),
                  SizeMargin.size(width: 6.0),
                  const Text(
                    "Filter By",
                    style: TextStyle(
                      color: AppColor.lightgrey,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          SizeMargin.size(height: 12.0),
          const Text(
            "Load Location",
            style: TextStyle(
              color: AppColor.lightgrey,
            ),
          ),
          SizeMargin.size(height: 4.0),
          Wrap(
            spacing: 8.0,
            children: const [
              CustomChip(
                title: "Near Me",
                isActive: true,
              ),
              CustomChip(title: "Manual"),
            ],
          ),
          SizeMargin.size(height: 24.0),
          const Text(
            "Truck Category",
            style: TextStyle(
              color: AppColor.lightgrey,
            ),
          ),
          SizeMargin.size(height: 4.0),
          Wrap(
            spacing: 8.0,
            children: const [
              CustomChip(
                title: "Any",
                isActive: true,
              ),
              CustomChip(title: "Mini Truck"),
              CustomChip(title: "Large Truck"),
              CustomChip(title: "Pickup Truck"),
            ],
          ),
          SizeMargin.size(height: 24.0),
          const Text(
            "Load Weight",
            style: TextStyle(
              color: AppColor.lightgrey,
            ),
          ),
          SizeMargin.size(height: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    label: Text(
                      "${_sliderValue.value.start.ceil()}kg",
                    ),
                  ),
                  Container(
                    height: 2.0,
                    width: 10.0,
                    decoration: ShapeDecoration(
                      color: const Color(0XFF5B5B5B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    label: Text(
                      "${_sliderValue.value.end.ceil()}kg",
                    ),
                  ),
                ],
              ),
              SizeMargin.size(height: 8.0.h),
              SfRangeSlider(
                min: 1000,
                max: 50000,
                stepSize: 500,
                values: _sliderValue.value,
                inactiveColor: const Color(0XFFDCDCDC),
                // activeColor: const Color(0XFF19352A),
                onChanged: (SfRangeValues newValues) {
                  _sliderValue.value = newValues;
                },
              ),
              // slider here
              SizeMargin.size(height: 12.0),
              const Text(
                "Load Type",
                style: TextStyle(
                  color: AppColor.lightgrey,
                ),
              ),
              SizeMargin.size(height: 4.0),
              Wrap(
                spacing: 8.0,
                children: const [
                  CustomChip(
                    title: "Full Truck Load",
                    isActive: true,
                  ),
                  CustomChip(
                    title: "Less Than Truck Load",
                  ),
                ],
              ),
            ],
          ),
          SizeMargin.size(height: 24.0.h),
          CustomRaisedButton(
            text: "Apply Filters",
            onPressed: () {
              // Get.toNamed(Routes.addLoadImages);
            },
          ),
          SizeMargin.size(height: 30.0.h),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("Reset"),
            ),
          )
        ],
      ),
    );
  }
}
