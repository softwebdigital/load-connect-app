import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/load_details_card.dart';
import 'package:load_connect/view/providers/user/load_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:load_connect/view/screens/widgets/custom_check_icon.dart';
import 'package:load_connect/view/screens/widgets/custom_chip.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/screens/widgets/spacer_widget.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HistoryTab extends HookWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoadProvider>(context);
    // final loadStatus = useState("created");
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            toolbarHeight: kToolbarHeight.h,
            automaticallyImplyLeading: false,
            title: const Text("Load History"),
            actions: [
              IconButton(
                onPressed: () async {
                  final _ = await _sortLoads(context);
                  // print(result);
                },
                icon: const Icon(
                  Icons.sort_rounded,
                ),
              ),
              IconButton(
                onPressed: () {
                  _filterLoads(context);
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
              ),
              const NotificationIconWidget(),
            ],
          ),
        ];
      },
      body: provider.isLoading ? const Center(
        child: CircularProgressIndicator.adaptive(),
      ) : provider.isError ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Error: ${provider.message}"),
          ColumnSpace(10),
          InkWell(
            onTap: () => provider.initialize(),
            child: const Text("Reload")
          )
        ],
      ) : provider.loads.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your Load History Is Empty"),
          ColumnSpace(10),
          InkWell(
              onTap: () => provider.refresh(),
              child: const Text("Reload")
          )
        ],
      ) : RefreshIndicator(
        onRefresh: () async => provider.refresh(),
        child: ListView.builder(
          itemCount: provider.loads.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (_, index) {
            final load = provider.loads[index];
            return LoadDetailsCard(
              load: load,
            );
          },
        ),
      ),
    );
  }

  _filterLoads(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return _FilterLoadBottomSheet(
          ctx: context,
        );
      },
    );
  }

  Future<String?> _sortLoads(BuildContext context) {
    return showModalBottomSheet<String>(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.sort_outlined),
                        SizeMargin.size(width: 6.0),
                        const Text("Sort By"),
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
                for (var sortType in _sortTypes)
                  ListTile(
                    contentPadding: const EdgeInsets.only(right: 16.0),
                    onTap: () {
                      Navigator.pop(context, sortType['value']);
                    },
                    title: Text(
                      sortType['title']!,
                    ),
                    trailing: sortType['value'] == 'newest'
                        ? const CustomCheckIcon()
                        : null,
                  )
              ],
            ),
          );
        });
  }

  final List<Map<String, String>> _sortTypes = const [
    {
      'title': "Newest First",
      'value': 'newest',
    },
    {
      'title': "Date Delivered",
      'value': 'delivered',
    },
    {
      'title': "Load name A-Z",
      'value': 'load-name',
    },
    {
      'title': "Driver name A-Z",
      'value': 'driver-name',
    }
  ];
}

class _FilterLoadBottomSheet extends HookWidget {
  const _FilterLoadBottomSheet({Key? key, required this.ctx}) : super(key: key);
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final _sliderValue = useState(const SfRangeValues(0.0, 60.0));
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
            "Load status",
            style: TextStyle(
              color: AppColor.lightgrey,
            ),
          ),
          SizeMargin.size(height: 4.0),
          Wrap(
            spacing: 8.0,
            children: const [
              CustomChip(
                title: "Created",
                isActive: true,
              ),
              CustomChip(title: "Negotiating"),
              CustomChip(title: "Out for delivery"),
              CustomChip(title: "Ready for pickup"),
            ],
          ),
          SizeMargin.size(height: 24.0),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    label: const Text(
                      "0kg",
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
                    label: const Text(
                      "100kg",
                    ),
                  ),
                ],
              ),
              SizeMargin.size(height: 8.0.h),
              SfRangeSlider(
                min: 0.0,
                max: 100.0,
                values: _sliderValue.value,
                inactiveColor: const Color(0XFFDCDCDC),
                // activeColor: const Color(0XFF19352A),
                onChanged: (SfRangeValues newValues) {
                  _sliderValue.value = newValues;
                },
              )
              // slider here
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
