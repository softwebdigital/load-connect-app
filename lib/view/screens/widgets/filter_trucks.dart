import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'custom_chip.dart';

class FilterTrucksBottomSheet extends HookWidget {
  const FilterTrucksBottomSheet({Key? key, required this.ctx})
      : super(key: key);
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final _sliderValue = useState(const SfRangeValues(1000, 5000.0));
    final stateController = useTextEditingController(text: "Lagos");

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
                  const Icon(
                    Icons.filter_alt,
                    size: 20.0,
                    color: AppColor.lightgrey,
                  ),
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
            "Load location",
            style: TextStyle(
              color: AppColor.lightgrey,
            ),
          ),
          SizeMargin.size(height: 4.0),
          Wrap(
            spacing: 8.0,
            children: const [
              CustomChip(title: "Near Me"),
              CustomChip(title: "Manual", isActive: true),
            ],
          ),
          SizeMargin.size(height: 12.0),
          CustomTextField(
            label: "Choose State",
            controller: stateController,
            suffixIcon: const Icon(
              Icons.chevron_right_rounded,
            ),
            readOnly: true,
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
              CustomChip(title: "Any", isActive: true),
              CustomChip(
                title: "Mini Truck",
              ),
              CustomChip(
                title: "Pickup Truck",
              ),
              CustomChip(
                title: "Large Truck",
              )
            ],
          ),
          SizeMargin.size(height: 24.0),
          const Text(
            "Truck Weight",
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
                      "${roundNumber(_sliderValue.value.start)}kg",
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
                      "${roundNumber(_sliderValue.value.end)}kg",
                    ),
                  ),
                ],
              ),
              SizeMargin.size(height: 8.0.h),
              SfRangeSlider(
                min: 1000.0,
                max: 50000.0,
                stepSize: 500,
                values: _sliderValue.value,
                inactiveColor: const Color(0XFFDCDCDC),
                // activeColor: const Color(0XFF19352A),
                onChanged: (SfRangeValues newValues) {
                  _sliderValue.value = newValues;
                  // setState(() {
                  //   _values = newValues;
                  // });
                },
              ),
              // slider here
              SizeMargin.size(height: 24.0),
              const Text(
                "Truck Capacity",
                style: TextStyle(
                  color: AppColor.lightgrey,
                ),
              ),
              SizeMargin.size(height: 4.0),
              Wrap(
                spacing: 8.0,
                children: const [
                  CustomChip(title: "Full Truck Load", isActive: true),
                  CustomChip(title: "Less Than Truck Load"),
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

  int roundNumber(dynamic value) {
    if (value is double) return value.round();
    return value;
  }
}
