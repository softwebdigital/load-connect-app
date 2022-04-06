import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:load_connect/view/components/truck_details_card.dart';
import 'package:load_connect/view/screens/widgets/filter_trucks.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/screens/widgets/sort_trucks.dart';

class FindTrucksTab extends StatelessWidget {
  const FindTrucksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            toolbarHeight: kToolbarHeight.h,
            automaticallyImplyLeading: false,
            title: const Text("Find Trucks"),
            actions: [
              IconButton(
                onPressed: () async {
                  final _ = await _sortTrucks(context);
                  // print(result);
                },
                icon: const Icon(
                  Icons.sort_rounded,
                ),
              ),
              IconButton(
                onPressed: () {
                  _filterTrucks(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
              ),
              const NotificationIconWidget(),
            ],
          )
        ];
      },
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TruckDetailsCard(),
            TruckDetailsCard(),
            // SizeMargin.size(width: 14.0),
          ],
        ),
      ),
    );
  }

  Future<String?> _sortTrucks(BuildContext context) {
    return showModalBottomSheet<String?>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SortTruckBottomSheet(
        ctx: context,
      ),
    );
  }

  Future<dynamic> _filterTrucks(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => FilterTrucksBottomSheet(
        ctx: context,
      ),
    );
  }
}
