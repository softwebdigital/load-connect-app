import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/providers/truck_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import 'invite_truck_to_load.dart';

class TruckDetailsScreen extends StatefulWidget {
  const TruckDetailsScreen({
    Key? key,
    required this.truck
  }) : super(key: key);

  final VehicleModel truck;

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<TruckProvider>();
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          "Truck Details",
          style: TextStyle(fontSize: 18.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () => provider.saveTruck(widget.truck.id!),
            icon: const Icon(
              Icons.favorite_outline_rounded,
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizeMargin.size(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemTile(
                    "Truck Name",
                    "Mercedes benz actros",
                  ),
                  _itemTile(
                    "Truck Weight",
                    "523.2 Kilograms",
                    "25 Pounds",
                  ),
                  _itemTile(
                    "Estimated Distance Away",
                    "23 Kilometers",
                    "5 Miles",
                  ),

                  _itemTile(
                    "Truck Category",
                    "Mini Truck",
                  ),
                  _itemTile(
                    "Truck Capacity",
                    "Full Truck Load",
                  ),
                  SizeMargin.size(height: 24.0),

                  /// [carousel should be here]

                  const Text(
                    "Truck Images",
                    style: TextStyle(
                      color: AppColor.lightgrey,
                    ),
                  ),

                  SizeMargin.size(height: 4.0),
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      // enlargeCenterPage: true,
                      height: 200,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    carouselController: _controller,
                  ),

                  SizeMargin.size(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.previousPage();
                        },
                        child: const CircleAvatar(
                          radius: 18.0,
                          backgroundColor: AppColor.darkGreen,
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColor.white100,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : AppColor.darkGreen)
                                    .withOpacity(
                                  _current == entry.key ? 0.9 : 0.2,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage();
                        },
                        child: const CircleAvatar(
                          radius: 18.0,
                          backgroundColor: AppColor.darkGreen,
                          child: Icon(
                            Icons.chevron_right,
                            color: AppColor.white100,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// [carousel should be here]
                ],
              ),
            ),
            SizeMargin.size(height: 16.0),
            Container(
              color: AppColor.white200,
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.person,
                        color: AppColor.lightgrey,
                        size: 20.0,
                      ),
                      SizeMargin.size(width: 4.0),
                      const Text(
                        "Company Details",
                        style: TextStyle(color: AppColor.lightgrey),
                      ),
                    ],
                  ),
                  SizeMargin.size(height: 16.0),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 18.0,
                        child: Icon(
                          Icons.person,
                          size: 20.0,
                          color: AppColor.white100,
                        ),
                      ),
                      SizeMargin.size(width: 4.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John Doe Business",
                            style: TextStyle(
                              color: AppColor.blackgrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          _getStarRatings()
                        ],
                      ),
                      const Spacer(),
                      // SizeMargin.size(height: 4.0),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColor.white300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            UniconsLine.envelope,
                            color: AppColor.darkGreen,
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizeMargin.size(width: 16.0),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColor.white300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            UniconsLine.phone,
                            color: AppColor.darkGreen,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizeMargin.size(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.apps_rounded,
                        color: AppColor.lightgrey,
                      ),
                      SizeMargin.size(width: 4.0),
                      const Text(
                        "Other Details",
                        style: TextStyle(
                          color: AppColor.lightgrey,
                        ),
                      ),
                    ],
                  ),
                  // SizeMargin.size(height: 20.0),

                  _itemTile(
                    "Date Joined",
                    "08/11/2021",
                  ),
                  SizeMargin.size(height: 24.0),
                  CustomRaisedButton(
                    text: "Invite truck to load",
                    onPressed: () {
                      Get.to(const InviteTruckToLoadScreen());
                    },
                  )
                ],
              ),
            ),
            SizeMargin.size(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _itemTile(String title, String content, [String? bottomText]) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12.0, color: AppColor.lightgrey),
                ),
                SizeMargin.size(height: 4.0),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 16.0, color: AppColor.blackgrey),
                ),
                if (bottomText != null) ...[
                  SizeMargin.size(height: 4.0),
                  Text(
                    bottomText,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColor.black300.withOpacity(0.6),
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getStarRatings() {
    return Row(
      children: [
        for (var _ in [1, 2, 3, 4])
          const Icon(
            Icons.star_rounded,
            color: Color(0XFFFFC000),
            size: 20.0,
          ),
        const Icon(
          Icons.star_half_rounded,
          color: Color(0XFFFFC000),
          size: 20.0,
        ),
      ],
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
              ],
            ),
          ),
        ))
    .toList();
