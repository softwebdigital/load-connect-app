import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/shared/colors.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/providers/user/driver_truck_provider.dart';
import 'package:load_connect_driver/view/screens/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

import '../../../components/truck_details_card.dart';
import '../../widgets/notification_icon.dart';

class MyTrucksTab extends HookWidget {
  const MyTrucksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isSearching = useState(false);
    final provider = Provider.of<DriverTruckProvider>(context);
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _isSearching.value
              ? SliverAppBar(
                  pinned: true,
                  // toolbarHeight: 80.0,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColor.white200,
                  title: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 14.0,
                      ),
                      hintText: "Start typing to search...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      prefixIcon: InkWell(
                        onTap: () {
                          _isSearching.value = !_isSearching.value;
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.darkGreen,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                )
              : SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: const Text("My Trucks"),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        Get.toNamed(Routes.addTruckInfo);
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _isSearching.value = !_isSearching.value;
                      },
                      icon: const Icon(
                        Icons.search_rounded,
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
        children: [
          Text(provider.message),
          ColumnSpace(15),
          TextButton(onPressed: () => provider.initialize(), child: const Text("Reload"))
        ],
      ) : provider.trucks.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You do not have any truck yet"),
          ColumnSpace(15),
          TextButton(onPressed: () => provider.initialize(), child: const Text("Refresh"))
        ],
      ) : ListView.builder(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          final truck = provider.trucks[index];
          return TruckDetailsCard(truck: truck,);
        },
        itemCount: provider.trucks.length,
      ),
    );
  }

  // Future<String?> _sortTrucks(BuildContext context) {
  //   return showModalBottomSheet<String?>(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (_) => SortTruckBottomSheet(
  //       ctx: context,
  //     ),
  //   );
  // }

  // Future<dynamic> _filterTrucks(BuildContext context) {
  //   return showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (_) => FilterTrucksBottomSheet(
  //       ctx: context,
  //     ),
  //   );
  // }
}
