import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/truck_details_card.dart';
import 'package:load_connect/view/screens/widgets/filter_trucks.dart';
import 'package:load_connect/view/screens/widgets/sort_trucks.dart';
import 'package:provider/provider.dart';

import '../../providers/user/recently_viewed_truck_provider.dart';
import '../widgets/spacer_widget.dart';

class RecentTrucksScreen extends StatelessWidget {
  const RecentTrucksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentTruckProvider = Provider.of<RecentlyViewedTruckProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Recent Trucks"),
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
        ],
      ),

      body: (recentTruckProvider.isLoading) ? const Center(
        child: CircularProgressIndicator.adaptive(),
      ) : (recentTruckProvider.isError) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(recentTruckProvider.message),
          const SizedBox(height: 10,),
          TextButton(
            child: const Text("Refresh"),
            onPressed: () => recentTruckProvider.initialize(),
          )
        ],
      ) :  (recentTruckProvider.trucks.isEmpty) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text("No recently viewed vehicle")),
          ColumnSpace(10),
          Center(
            child: InkWell(
              onTap: () => recentTruckProvider.refresh(),
              child: const Text("reload")
            ),
          )
        ],
      ) :  RefreshIndicator(
        onRefresh: () async {
          recentTruckProvider.refresh();
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          itemCount: recentTruckProvider.trucks.length,
          itemBuilder: (_, index) {
            final truck = recentTruckProvider.trucks[index];
            return TruckDetailsCard(
              truck: truck,
            );
          },
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
        onclick: (sT) {},
        sortValue: SortTerm.Newest,
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
