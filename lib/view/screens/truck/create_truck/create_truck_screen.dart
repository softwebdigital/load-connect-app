


import 'package:flutter/material.dart';
import 'package:load_connect_driver/view/all_screens.dart';
import 'package:load_connect_driver/view/providers/user/create_truck_provider.dart';
import 'package:provider/provider.dart';

class CreateTruckScreen extends StatelessWidget {
  const CreateTruckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateTruckProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        if (provider.currentPage != truckDetailScreen) {
          provider.back();
          return false;
        } else {
          // createLoadProvider.next();
          return true;
        }
      },
      child: Scaffold(
        body: Consumer<CreateTruckProvider>(
          builder: (context, provider, child) {
            // print(provider.currentPage);
            if (provider.currentPage == truckImageScreen) {
              return const AddTruckImagesScreen();
            }

            if (provider.currentPage == truckDocumentScreen) {
              return const AddTruckDocumentsScreen();
            }

            if (provider.currentPage == truckCarriageSpecScreen) {
              return const AddTruckSpecsScreen();
            }

            return const AddTruckInfoScreen();
          },
        ),
      ),
    );
  }
}
