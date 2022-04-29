import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/shared/colors.dart';
import 'package:load_connect_driver/shared/routes.dart';

import '../../../components/truck_details_card.dart';
import '../../widgets/notification_icon.dart';

class MyTrucksTab extends HookWidget {
  const MyTrucksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isSearching = useState(false);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TruckDetailsCard(),
            TruckDetailsCard(),
            // SizeMargin.size(width: 14.0),
          ],
        ),
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
