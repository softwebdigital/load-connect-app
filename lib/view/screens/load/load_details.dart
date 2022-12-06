import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/order_model.dart';
import 'package:load_connect/backend/models/entities/user_load.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/providers/load_detail_provider.dart';
import 'package:load_connect/view/utils/custom_icons_icons.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:unicons/unicons.dart';
import 'package:date_time_format/date_time_format.dart';

import '../../../shared/routes.dart';
import '../../utils/app_dialog.dart';

class LoadDetailsScreen extends StatefulWidget {
  const LoadDetailsScreen({Key? key, required this.load}) : super(key: key);

  final UserLoad load;

  @override
  State<LoadDetailsScreen> createState() => _LoadDetailsScreenState();
}

class _LoadDetailsScreenState extends State<LoadDetailsScreen> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => LoadDetailProvider(widget.load),
      builder: (context, child) {
        final provider = Provider.of<LoadDetailProvider>(context);
        final load = provider.load;

        final createdAt = DateTime.parse(load.createdAt!);
        final pickupDate = DateTime.parse(load.pickupDate!);
        final pickupDeadline = DateTime.parse(load.pickupDeadlineDate!);

        return Scaffold(
          appBar: CustomAppBar(
            title: const Text(
              "Load Details",
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
                  UniconsLine.edit_alt,
                ),
              )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              provider.refresh();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              CustomIcons.tracking,
                              color: AppColor.lightgrey,
                              size: 16.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(
                                "Load Status",
                                style: TextStyle(
                                  color: AppColor.lightgrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        _DeliveryProcesses(
                            processes: getProcess(context, load)
                        ),
                      ],
                    ),
                  ),
                  // SizeMargin.size(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              CustomIcons.box_1,
                              color: AppColor.lightgrey,
                              size: 16.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(
                                "Load Details",
                                style: TextStyle(
                                  color: AppColor.lightgrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizeMargin.size(height: 4.0),
                        _itemTile(
                          "Load Type",
                          "Full Truck Load",
                        ),
                        _itemTile(
                          "Load Weight",
                          "${load.loadWeight} Kilograms",
                          "25 Pounds",
                        ),
                        _itemTile(
                          "Load Description",
                          "${load.description}",
                        ),
                        _itemTile(
                          "Truck Category",
                          "${load.truckCategory}",
                        ),
                        /// [carousel should be here]


                        if ((load.loadimages ?? []).isNotEmpty)
                          ...[
                            SizeMargin.size(height: 24.0),
                            const Text(
                              "Load Images",
                              style: TextStyle(
                                color: AppColor.lightgrey,
                              ),
                            ),

                            SizeMargin.size(height: 4.0),
                            CarouselSlider(
                              items: imageSliders(load.loadimages ?? []),
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
                                  children: (load.loadimages ?? []).map((entry) {
                                    return GestureDetector(
                                      onTap: () => _controller.animateToPage((load.loadimages ?? []).indexOf(entry)),
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
                                            _current == (load.loadimages ?? []).indexOf(entry) ? 0.9 : 0.2,
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
                          ],

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
                              "Receiver's Details",
                              style: TextStyle(color: AppColor.lightgrey),
                            ),
                          ],
                        ),
                        SizeMargin.size(height: 16.0),
                        const Text(
                          "Receiver's name",
                          style: TextStyle(
                              color: AppColor.darkGreen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizeMargin.size(height: 4.0),
                        Text(
                          "${load.receiverName}",
                          style: TextStyle(
                              color: AppColor.blackgrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizeMargin.size(height: 16.0),
                        const Text(
                          "Reciever's phone number",
                          style: TextStyle(
                              color: AppColor.darkGreen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizeMargin.size(height: 4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${load.receiverPhone}",
                              style: const TextStyle(
                                  color: AppColor.blackgrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizeMargin.size(width: 4.0),
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
                          "Estimated Distance",
                          "23 Kilometers",
                          "5 Miles",
                        ),
                        _itemTile(
                          "Estimated Time Driving",
                          "1 hour, 30 minutes",
                        ),
                        _itemTile(
                          "Driver Truck Info",
                          "No driver has accepted yet",
                        ),
                        _itemTile(
                          "Pickup date",
                          pickupDate.format('D, M j, H:i'),
                        ),
                        _itemTile(
                          "Deadline for load pickup",
                          pickupDeadline.format('D, M j, H:i'),
                        ),
                        _itemTile(
                          "Date created",
                          createdAt.format('D, M j, H:i'),
                        ),
                      ],
                    ),
                  ),
                  SizeMargin.size(height: 20.0),
                ],
              ),
            ),
          ),
        );
      },
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

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: const Color(0xff989898),
          indicatorTheme: const IndicatorThemeData(
            position: 0,
            size: 20.0,
          ),
          connectorTheme: const ConnectorThemeData(
            thickness: 2.5,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: processes.length,
          contentsBuilder: (_, index) {
            // if (processes[index].isCompleted) return null;

            return _LoadStatusCard(
              process: processes[index],
            );
          },
          indicatorBuilder: (_, index) {
            if (processes[index].isCompleted) {
              return const DotIndicator(
                color: Color(0xff5FBB97),
                // child: Icon(
                //   Icons.check,
                //   color: Colors.white,
                //   size: 12.0,
                // ),
              );
            } else {
              return const DotIndicator(
                color: Color(0XFFF7F7F7),
                // borderWidth: 2.5,
              );
            }
          },
          connectorBuilder: (_, index, ___) => SolidLineConnector(
            color: processes[index].isCompleted
                ? const Color(0xff5FBB97)
                : const Color(0XFFF7F7F7),
          ),
        ),
      ),
    );
  }
}


getProcess(BuildContext context, UserLoad load) {
  return [
    _DeliveryProcess(
      "Load Request",
      "Driver",
      "No driver has accepted yet",
        extraContent: Container(),
        isCompleted: loadStatusMap[load.status!]! > 0
    ),
    _DeliveryProcess(
      "Negotiating",
      "Estimated Fee",
      "₦${load.loadValue}",
      extraContent: Row(
        children: [
          const SizedBox(width: 29,),
          InkWell(
            onTap: () async {
              final price = await AppDialog.negotiateDialog(
                content: "This would log you out",
                onTap: () {
                  // Get.offAllNamed(Routes.login);
                },
                buttonColor: AppColor.darkGreen,
              );

              if (price != null) {
                Provider.of<LoadDetailProvider>(context, listen: false).negotiateOffer(num.parse(price));
              }
            },
            child: Container(
              height: 41, width: 41,
              decoration: BoxDecoration(
                color: const Color(0xFF8DDCA4).withOpacity(.20),
                borderRadius: BorderRadius.circular(13)
              ),
              child: const Center(child: Icon(Icons.refresh, color: Color(0xFF007683),)),
            ),
          ),
          const SizedBox(width: 24,),
          InkWell(
            onTap: () {
              AppDialog.mainDialog(
                title: "Accept the offered amount of ₦2,500?",
                content: "You are accepting to pickup and deliver the load for ₦2,500. This can’t be changed later on",
                onTap: () {
                  // Get.offAllNamed(Routes.login);
                  Get.back();
                  Provider.of<LoadDetailProvider>(context, listen: false).acceptOffer();
                },
                buttonColor: AppColor.darkGreen,
                buttonText: "Yes, Accept"
              );
            },
            child: Container(
              height: 41, width: 41,
              decoration: BoxDecoration(
                color: const Color(0xFF8DDCA4).withOpacity(.20),
                borderRadius: BorderRadius.circular(13)
              ),
              child: const Center(child: Icon(Icons.check, color: Color(0xFF007683),)),
            ),
          ),
          const SizedBox(width: 24,),
          InkWell(
            onTap: () {
              AppDialog.mainDialog(
                title: "Decline the offered amount of ₦2,500?",
                content: "You would be declining the offered amount of ₦2,500 making yourself available to pick other waiting loads.",
                onTap: () {
                  // Get.offAllNamed(Routes.login);
                  Get.back();
                  Provider.of<LoadDetailProvider>(context, listen: false).declineOffer();
                },
                buttonColor: AppColor.error,
                buttonText: "Yes, Decline"
              );
            },
            child: Container(
              height: 41, width: 41,
              decoration: BoxDecoration(
                color: const Color(0xFF8DDCA4).withOpacity(.20),
                borderRadius: BorderRadius.circular(13)
              ),
              child: const Center(child: Icon(Icons.close, color: Color(0xFFFF1E0E),)),
            ),
          ),
        ],
      ),
      isCompleted: loadStatusMap[load.status!]! > 2
    ),
    _DeliveryProcess(
      "Ready for pickup",
      "Pickup Location",
      "${load.pickupLocation}",
        extraContent: Container(),
        isCompleted: loadStatusMap[load.status!]! > 3
    ),
    _DeliveryProcess(
      "Out for delivery",
      "Destination",
      "${load.destination}",
        extraContent: Container(),
        isCompleted: loadStatusMap[load.status!]! > 4
    ),
    _DeliveryProcess(
      "Delivered",
      "",
      "",
      extraContent: Container(),
      isCompleted: loadStatusMap[load.status!]! == 5
    ),
  ];
}
// final

class _DeliveryProcess {
  const _DeliveryProcess(
    this.title,
    this.type,
    this.content,
  {
    this.extraContent,
    this.isCompleted = false
  }

  );

  // const _DeliveryProcess.complete()
  //     : name = 'Done',
  //       messages = const [];

  final String title;
  final String type;
  final String content;
  final Widget? extraContent;
  final bool isCompleted;
}

class _LoadStatusCard extends StatelessWidget {
  const _LoadStatusCard({Key? key, required this.process}) : super(key: key);
  final _DeliveryProcess process;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, left: 16.0),
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        color: process.isCompleted
            ? const Color.fromRGBO(141, 220, 164, 0.2)
            : AppColor.white200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            process.title,
            style: TextStyle(
              color: process.isCompleted
                  ? AppColor.primaryColor
                  : AppColor.black300.withOpacity(0.5),
              fontWeight:
                  process.isCompleted ? FontWeight.w700 : FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          if (process.type.isNotEmpty) ...[
            SizeMargin.size(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        process.type,
                        style: const TextStyle(
                          color: AppColor.lightgrey,
                        ),
                      ),
                      SizeMargin.size(height: 4.0),
                      DefaultTextStyle(
                        style: const TextStyle(),
                        child: Text(
                          process.content,
                          style: const TextStyle(
                            color: AppColor.black300,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                if (process.extraContent != null)
                  ...[
                    process.extraContent!
                  ],
              ],
            ),
          ]
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
List<Widget> imageSliders(List<Loadimages> images) => images
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item.url ?? imgList[0], fit: BoxFit.cover, width: 1000.0),
              ],
            ),
          ),
        ))
    .toList();
