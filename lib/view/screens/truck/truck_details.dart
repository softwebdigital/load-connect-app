import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../components/custom_appbar.dart';
import '../../utils/helper.dart';

class TruckDetailsScreen extends StatefulWidget {
  const TruckDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: const Icon(
              Icons.border_color_outlined,
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
                    items: _imageSliders,
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
                        children: _imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
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
            SizeMargin.size(height: 24.0),

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
}

final List<String> _imgList = [
  'https://images.unsplash.com/photo-1601508836900-ee2aa7840a7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=813&q=80',
  'https://images.unsplash.com/photo-1611083203153-1f0f49fcf093?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  'https://images.unsplash.com/photo-1568392388563-e7b357fa41d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
];
final List<Widget> _imageSliders = _imgList
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
