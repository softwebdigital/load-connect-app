import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:load_connect_driver/view/components/load_details_card.dart';
import 'package:load_connect_driver/view/screens/widgets/filter_load_bottom_sheet.dart';
import 'package:load_connect_driver/view/screens/widgets/sort_load_bottom_sheet.dart';
import '../../widgets/notification_icon.dart';

class NewLoadsTab extends HookWidget {
  const NewLoadsTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sortValue = useState("newest");
    // final loadStatus = useState("created");
    return NestedScrollView(
      // padding: const EdgeInsets.all(16.0),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            title: const Text("New Loads"),
            actions: [
              IconButton(
                onPressed: () async {
                  final result = await _sortLoads(context, sortValue.value);
                  if (result != null) {
                    sortValue.value = result;
                  }
                },
                icon: const Icon(
                  Icons.sort_rounded,
                ),
              ),
              IconButton(
                onPressed: () {
                  _filterLoads(context);
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
              ),
              const NotificationIconWidget(),
            ],
          ),
        ];
      },
      body: ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
          return const LoadDetailsCard(
            isForCurrentDriver: false,
          );
        },
      ),
    );
  }

  _filterLoads(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return FilterLoadBottomSheet(
          ctx: context,
        );
      },
    );
  }

  Future<String?> _sortLoads(
    BuildContext context, [
    String sortValue = 'newest',
  ]) {
    return showModalBottomSheet<String>(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SortLoadBottomSheet(
          ctx: context,
          sortTypes: _sortTypes,
          sortValue: sortValue,
        );
      },
    );
  }

  final List<Map<String, String>> _sortTypes = const [
    {
      'title': "Newest First",
      'value': 'newest',
    },
    {
      'title': "Date Delivered",
      'value': 'delivered',
    },
    {
      'title': "Load name A-Z",
      'value': 'load-name',
    },
    {
      'title': "Driver name A-Z",
      'value': 'driver-name',
    }
  ];
}
