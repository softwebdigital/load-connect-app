import 'package:flutter/material.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/load_details_card.dart';

class InviteTruckToLoadScreen extends StatelessWidget {
  const InviteTruckToLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Choose Load"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        itemCount: 3,
        itemBuilder: (_, index) {
          return const LoadDetailsCard(
            isDetails: false,
          );
        },
      ),
    );
  }
}
