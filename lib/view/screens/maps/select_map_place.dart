import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/utils/helper.dart';

class SelectPlaceOnMap extends StatefulWidget {
  const SelectPlaceOnMap({Key? key}) : super(key: key);

  @override
  State<SelectPlaceOnMap> createState() => _SelectPlaceOnMapState();
}

class _SelectPlaceOnMapState extends State<SelectPlaceOnMap> {
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _mapController;
  final TextEditingController _textController = TextEditingController();
  double mapBottomPadding = 0.0;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late final String pageTitle;

  @override
  void initState() {
    super.initState();
    setPageParams();
  }

  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Choose $pageTitle"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _mapController = controller;
              setState(() {
                mapBottomPadding = 180.0.h;
              });
            },
            onTap: (v) {
              consoleLog(v);
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFFE2E2E2),
                    blurRadius: 15.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    decoration: ShapeDecoration(
                      color: const Color(0XFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: const ShapeDecoration(
                            color: AppColor.green,
                            shape: CircleBorder(),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            controller: _textController,
                            decoration: InputDecoration(
                              label: Text(
                                "${pageTitle.capitalizeFirst}",
                                style: const TextStyle(
                                  color: Color(0XFF808080),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              enabledBorder: border,
                              errorBorder: border,
                              border: border,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizeMargin.size(height: 24.0.h),
                  CustomRaisedButton(
                    text: "Confirm $pageTitle",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void setPageParams() {
    final args = Get.arguments as Map<String, dynamic>?;
    pageTitle = args?['page_title'] ?? "Location";
  }
}
