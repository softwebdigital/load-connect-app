import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:load_connect_driver/shared/colors.dart';
import 'package:load_connect_driver/view/utils/helper.dart';

import 'custom_check_icon.dart';

class SortLoadBottomSheet extends HookWidget {
  const SortLoadBottomSheet(
      {Key? key,
      required this.ctx,
      required this.sortTypes,
      this.sortValue = 'newest'})
      : super(key: key);
  final BuildContext ctx;
  final List<Map<String, String>> sortTypes;
  final String sortValue;

  @override
  Widget build(BuildContext context) {
    final sortTypeValue = useState(sortValue);
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
                  const Icon(
                    Icons.sort_outlined,
                    color: AppColor.lightgrey,
                  ),
                  SizeMargin.size(
                    width: 6.0,
                  ),
                  const Text(
                    "Sort By",
                    style: TextStyle(
                      color: AppColor.lightgrey,
                    ),
                  ),
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
          for (var sortType in sortTypes)
            ListTile(
              contentPadding: const EdgeInsets.only(right: 16.0),
              onTap: () {
                Navigator.pop(context, sortType['value']);
              },
              title: Text(
                sortType['title']!,
                style: TextStyle(
                  color: sortType['value'] == sortTypeValue.value
                      ? AppColor.darkGreen
                      : AppColor.blackgrey,
                  fontWeight: sortType['value'] == sortTypeValue.value
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
              ),
              trailing: sortType['value'] == sortTypeValue.value
                  ? const CustomCheckIcon(
                      successColor: AppColor.darkGreen,
                    )
                  : null,
            )
        ],
      ),
    );
  }
}
