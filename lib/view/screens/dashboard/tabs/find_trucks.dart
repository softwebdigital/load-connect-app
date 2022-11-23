import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/view/components/truck_details_card.dart';
import 'package:load_connect/view/providers/closest_available_truck_provider.dart';
import 'package:load_connect/view/providers/truck_provider.dart';
import 'package:load_connect/view/screens/widgets/filter_trucks.dart';
import 'package:load_connect/view/screens/widgets/notification_icon.dart';
import 'package:load_connect/view/screens/widgets/sort_trucks.dart';
import 'package:load_connect/view/screens/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class FindTrucksTab extends StatelessWidget {
  const FindTrucksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TruckProvider>(context);
    // return ChangeNotifierProvider(
    //   create: (context) => ClosestVehicleProvider(),
    //   builder: (context, child) {
    //     final provider = Provider.of<ClosestVehicleProvider>(context);
    //     ;
    //   },
    // );
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
      body: provider.isLoading ? const Center(
        child: CircularProgressIndicator.adaptive(),
      ) : provider.isError ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(provider.message),
          ColumnSpace(10),
          InkWell(
              onTap: () => provider.initialize(),
              child: const Text("reload")
          )
        ],
      ) : provider.trucks.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("No available vehicle"),
          ColumnSpace(10),
          InkWell(
              onTap: () => provider.initialize(),
              child: const Text("reload")
          )
        ],
      ) : ListView.builder(
        itemCount: provider.trucks.length,
        itemBuilder: (context, index) {
          final truck = provider.trucks[index];
          return TruckDetailsCard(
            truck: truck,
          );
        },
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
