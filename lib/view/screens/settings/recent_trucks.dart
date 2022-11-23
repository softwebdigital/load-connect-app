import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/truck_details_card.dart';
import 'package:load_connect/view/screens/widgets/filter_trucks.dart';
import 'package:load_connect/view/screens/widgets/sort_trucks.dart';

class RecentTrucksScreen extends StatelessWidget {
  const RecentTrucksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 20.0.h,
          horizontal: 16.0.w,
        ),
        itemCount: 3,
        itemBuilder: (_, index) {
          return TruckDetailsCard(
            truck: VehicleModel(),
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
