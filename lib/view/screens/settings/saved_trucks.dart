import 'package:flutter/material.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/truck_details_card.dart';
import 'package:load_connect/view/providers/user/saved_truck_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/spacer_widget.dart';

class SavedTrucksScreen extends StatelessWidget {
  const SavedTrucksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedTruckProvider = Provider.of<SavedTruckProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Saved Trucks"),
      ),
      body: (savedTruckProvider.isLoading) ? const Center(
        child: CircularProgressIndicator.adaptive(),
      ) : (savedTruckProvider.isError) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(savedTruckProvider.message),
          const SizedBox(height: 10,),
          TextButton(
            child: const Text("Refresh"),
            onPressed: () => savedTruckProvider.initialize(),
          )
        ],
      ) : (savedTruckProvider.trucks.isEmpty) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text("No saved truck")),
          ColumnSpace(10),
          Center(
            child: InkWell(
              onTap: () => savedTruckProvider.refresh(),
              child: const Text("reload")
            ),
          )
        ],
      ) :  RefreshIndicator(
        onRefresh: () async {
          savedTruckProvider.refresh();
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          itemCount: savedTruckProvider.trucks.length,
          itemBuilder: (_, index) {
            final truck = savedTruckProvider.trucks[index];
            return TruckDetailsCard(
              truck: truck,
            );
          },
        ),
      ),
    );
  }
}
