import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect_driver/view/components/custom_appbar.dart';
import 'package:load_connect_driver/view/screens/widgets/custom_check_icon.dart';
import 'package:load_connect_driver/view/utils/custom_icons.dart';

import '../../../../shared/colors.dart';
import '../../../components/custom_button.dart';
import '../../../utils/helper.dart';

class MembershipAndPlanScreen extends HookWidget {
  const MembershipAndPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isBusy = useState(false);
    // final documentType = useState("");

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Membership & Plans"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0.w,
        ),
        children: [
          _MembershipType(
            title: 'Premium',
            itemList: _itemList,
            isActivePlan: true,
            isRecommended: true,
          ),
          _MembershipType(
            title: 'Standard',
            itemList: _itemList,
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> _itemList = const [
    {"title": "Volutpat velit cursus.", "value": "true"},
    {"title": "Massa cursus dignissim viverra.", "value": "true"},
    {"title": "Vel euismod donec ultricies", "value": "true"},
    {"title": "Quis tellus feugiat sem diam.", "value": "false"},
  ];
}

class _MembershipType extends StatelessWidget {
  const _MembershipType({
    Key? key,
    required this.title,
    this.isActivePlan = false,
    this.isRecommended = false,
    required this.itemList,
  }) : super(key: key);
  final String title;
  final bool isActivePlan;
  final bool isRecommended;
  final List<Map<String, dynamic>> itemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isActivePlan) ...[
          const Text(
            "Your Active Plan",
            style: TextStyle(
              color: AppColor.lightgrey,
              fontSize: 12.0,
            ),
          ),
          SizeMargin.size(height: 10.0.h),
        ],
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: ShapeDecoration(
            color: AppColor.white200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (isRecommended) ...[
                    SizeMargin.size(width: 10.0.w),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 7.0,
                      ),
                      decoration: ShapeDecoration(
                        color: AppColor.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CustomIcons.premium_2,
                            size: 14.0,
                            color: AppColor.darkGreen,
                          ),
                          SizeMargin.size(width: 5.0.w),
                          const Text(
                            "Recommended",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                              color: AppColor.darkGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ],
              ),
              SizeMargin.size(height: 4.0.h),
              const Text(
                "Molestie id non, enim risus quam mi sit vel habitant. Posuere cras et massa vitae lorem vulputate risus. Eget at tristique aliquet rutrum ante mauris donec tincidunt vestibulum.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.lightgrey,
                ),
              ),
              SizeMargin.size(height: 12.0.h),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: RichText(
                    text: const TextSpan(
                      text: "₦100,000",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: "/year",
                          style: TextStyle(
                            color: AppColor.lightgrey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    // ExpansionPanelRadio(ex, body: null),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: ShapeDecoration(
                        color: const Color(0XFFEBEBEB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (var item in itemList)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                children: [
                                  CustomCheckIcon(
                                    height: 15.0,
                                    width: 15.0,
                                    iconSize: 12.5,
                                    isChecked: item['value'] == 'true',
                                  ),
                                  SizeMargin.size(width: 10.0),
                                  Expanded(child: Text(item['title']!)),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizeMargin.size(height: 10.0.h),
              CustomRaisedButton(
                backgroundColor:
                    isActivePlan ? AppColor.error : AppColor.darkGreen,
                text: isActivePlan ? "Cancel Subsciption" : "Choose Plan",
                onPressed: () {
                  snackBar(context, "Subscription activated");
                },
              ),
            ],
          ),
        ),
        SizeMargin.size(height: 24.0.h),
      ],
    );
  }
}
