import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/view/components/custom_appbar.dart';
import 'package:load_connect_driver/view/providers/user/saved_load_provider.dart';
import 'package:load_connect_driver/view/screens/widgets/filter_load_bottom_sheet.dart';
import 'package:load_connect_driver/view/screens/widgets/sort_load_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../components/load_details_card.dart';

class SavedOrRecentLoadsScreen extends HookWidget {
  const SavedOrRecentLoadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedLoadProvider>(context);
    final String screenLoadType = Get.parameters['type'] ?? 'saved';
    // print(screenLoadType);
    final sortValue = useState("newest");
    // final loadStatus = useState("created");
    return Scaffold(
      // padding: const EdgeInsets.all(16.0),

      appBar: CustomAppBar(
        title: Text("${screenLoadType.capitalize} Loads"),
        actions: screenLoadType == 'recent'
            ? [
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
              ]
            : [],
      ),

      body: ListView.builder(
        itemCount: provider.loads.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
          final load = provider.loads[index];
          return LoadDetailsCard(
            load: load,
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
