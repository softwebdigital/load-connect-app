import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/address_result.dart';
import 'package:load_connect/backend/models/entities/prediction_result.dart';
import 'package:load_connect/backend/repositories/util_repo.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

class GooglePlaceFindScreen extends StatefulWidget {
  const GooglePlaceFindScreen({Key? key}) : super(key: key);

  @override
  State<GooglePlaceFindScreen> createState() => _SelectPlaceOnMapState();
}

class _SelectPlaceOnMapState extends State<GooglePlaceFindScreen> {
  final StreamController<String> _streamController = StreamController();
  late final String pageTitle;
  final _utilRepo = Get.find<UtilRepo>();
  bool _isBusy = false;
  String _currentValue = "";
  List<PredictionResult> predictions = [];
  AddressResult? address;

  @override
  void initState() {
    super.initState();
    setPageParams();
    _streamController.stream
        .debounce(const Duration(milliseconds: 400))
        .listen(_onInputChange);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Choose ${pageTitle.capitalizeFirst}",
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 16.0.w),
            color: const Color(0XFFF2F2F2),
            child: Container(
              padding: const EdgeInsets.only(left: 12.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
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
                      onChanged: (val) {
                        _streamController.sink.add(val);
                      },
                      decoration: InputDecoration(
                        label: Text(
                          pageTitle,
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
          ),
          if (predictions.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                itemBuilder: (_, index) {
                  return _LocationTile(
                    prediction: predictions[index],
                    onTap: (placeId) async {
                      _fetchAddress(placeId);
                    },
                  );
                },
                separatorBuilder: (_, __) => Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
                itemCount: predictions.length,
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0.h),
                    child: Icon(
                      UniconsLine.location_point,
                      color: AppColor.white300,
                      size: 180.0.w,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Type a search query to get address predictions",
                      style: TextStyle(
                        color: AppColor.lightgrey,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  void setPageParams() {
    final args = Get.arguments as Map<String, dynamic>?;
    pageTitle = args?['page_title'] ?? "Location";
  }

  _onInputChange(String value) {
    consoleLog(value);
    if (_isBusy) return;
    if (_currentValue == value) {
      return;
    }
    _currentValue = value;

    _fetchPredictions(value);
  }

  _fetchPredictions(String query) async {
    setBusy(true);
    showProgress(context);
    try {
      //some api shii
      final result = await _utilRepo.searchGooglePlaces(query);
      Navigator.pop(context);
      setBusy(false);
      if (result.status) {
        setState(() {
          predictions = result.data ?? [];
        });
      } else {
        snackBar(context, result.message);
      }
    } catch (e) {
      Navigator.pop(context);
      setBusy(false);
    }
  }

  _fetchAddress(String placeId) async {
    setBusy(true);
    showProgress(context);
    try {
      //some api shii
      final result = await _utilRepo.findPlaceDetails(placeId);
      Navigator.pop(context);
      setBusy(false);
      if (result.status) {
        Get.back(result: result.data);
      } else {
        snackBar(context, result.message);
      }
    } catch (e) {
      Navigator.pop(context);
      setBusy(false);
    }
  }

  void setBusy(bool value) {
    if (mounted) {
      setState(() {
        _isBusy = value;
      });
    }
  }
}

class _LocationTile extends StatelessWidget {
  const _LocationTile({
    Key? key,
    required this.prediction,
    this.onTap,
  }) : super(key: key);
  final PredictionResult prediction;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!(prediction.placeId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 6.0,
        ),
        child: Row(
          children: [
            Icon(
              UniconsLine.location_point,
              color: const Color(0XFFDCDCDC).withOpacity(0.8),
            ),
            SizeMargin.size(width: 10.0.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prediction.mainAddr,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AppColor.black300,
                    ),
                  ),
                  SizeMargin.size(height: 4.0.h),
                  Text(
                    prediction.secondaryAddr,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AppColor.lightgrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
