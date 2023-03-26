


import 'dart:collection';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'base_provider.dart';

class GoLiveProvider extends BaseProvider {

  Location location = Location();
  PermissionStatus? permissionStatus;
  bool serviceEnabled = false;
  LocationData? locationData;

  String goLiveLocation = "near-me";
  String availability = "immediate";
  String capacity = "full-truck-load";
  String dateAvailable = "full-truck-load";

  set setGoLiveLocation(String loc) {
    goLiveLocation = loc;
    notifyListeners();
  }

  set setAvailability(String loc) {
    availability = loc;
    notifyListeners();
  }

  set setDateAvailability(String loc) {
    dateAvailable = loc;
    notifyListeners();
  }

  set setCapacity(String loc) {
    capacity = loc;
    notifyListeners();
  }

  void _checkLocationPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        return;
      }
    }
    locationData = await location.getLocation();
  }

  Set<Circle> circles = HashSet<Circle>();

  GoLiveProvider() {
    _checkLocationPermission();
  }

  void goLive() {

  }


}