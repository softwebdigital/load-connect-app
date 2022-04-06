import 'package:flutter/material.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/truck_details_card.dart';

class SavedTrucksScreen extends StatelessWidget {
  const SavedTrucksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Saved Trucks"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        itemCount: 3,
        itemBuilder: (_, index) {
          return const TruckDetailsCard();
        },
      ),
    );
  }
}
