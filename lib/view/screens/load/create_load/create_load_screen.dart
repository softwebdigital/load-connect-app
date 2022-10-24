

import 'package:flutter/material.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/view/all_screens.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:provider/provider.dart';

class CreateLoadScreen extends StatelessWidget {
  const CreateLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createLoadProvider = Provider.of<CreateLoadProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        if (createLoadProvider.currentScreen != selectLoadLocationScreen) {
          createLoadProvider.back();
          return false;
        } else {
          // createLoadProvider.next();
          return true;
        }
      },
      child: Scaffold(
        body: Builder(
          builder: (context) {
            if (createLoadProvider.currentScreen == selectLoadLocationScreen) {
              return const SelectLoadLocationScreen();
            }

            if (createLoadProvider.currentScreen == addLoadDetailScreen) {
              return AddLoadDetailsScreen();
            }

            if (createLoadProvider.currentScreen == addLoadImageScreen) {
              return const AddLoadImagesScreen();
            }

            if (createLoadProvider.currentScreen == addLoadReceiverInfoScreen) {
              return const LoadReceiverInfoScreen();
            }

            if (createLoadProvider.currentScreen == addOtherLoadInfoScreen) {
              return const OtherLoadInfoScreen();
            }

            return const SelectLoadLocationScreen();
          },
        ),
      ),
    );
  }
}
