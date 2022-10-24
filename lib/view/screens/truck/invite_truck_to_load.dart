import 'package:flutter/material.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/load_details_card.dart';
import 'package:load_connect/view/providers/user/load_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:load_connect/view/screens/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class InviteTruckToLoadScreen extends StatelessWidget {
  const InviteTruckToLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoadProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Choose Load"),
      ),
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
              isDetails: false,
            );
          },
        ),
      ),
    );
  }
}
