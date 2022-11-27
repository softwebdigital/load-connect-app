import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/providers/truck_provider.dart';
import 'package:load_connect/view/utils/helper.dart';

import 'custom_check_icon.dart';

class SortTruckBottomSheet<T> extends HookWidget {
  const SortTruckBottomSheet({
    Key? key, required this.ctx,
    this.sortValue = SortTerm.Newest,
    required this.onclick
  }) : super(key: key);

  final BuildContext ctx;
  final Function onclick;

  final SortTerm sortValue;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.sort_outlined),
                  SizeMargin.size(width: 6.0),
                  const Text("Sort By"),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          SizeMargin.size(height: 12.0),
          for (var sortType in _sortTypes)
            ListTile(
              contentPadding: const EdgeInsets.only(right: 16.0),
              onTap: () {
                onclick(sortType['value'] as SortTerm);
                Navigator.pop(context);
              },
              title: Text(
                sortType['title']!,
                style: TextStyle(
                  color: sortType['value'] == sortValue
                      ? AppColor.darkGreen
                      : AppColor.blackgrey,
                  fontWeight: sortType['value'] == sortValue
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
              ),
              trailing: sortType['value'] == sortValue
                  ? const CustomCheckIcon()
                  : null,
            )
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> _sortTypes = const [
    {
      'title': "Newest First",
      'value': SortTerm.Newest,
    },
    {
      'title': "Date Delivered",
      'value': SortTerm.DateDelivered,
    },
    {
      'title': "Load name A-Z",
      'value': SortTerm.LoadAtoZ,
    },
    {
      'title': "Driver name A-Z",
      'value': SortTerm.DriverAtoZ,
    }
  ];
}

enum SortTerm {Newest, DateDelivered, LoadAtoZ, DriverAtoZ}