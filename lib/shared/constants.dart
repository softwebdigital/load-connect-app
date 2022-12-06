import 'package:load_connect/shared/routes.dart';

class AppData {
  static const appName = "Load Connect";
  static const googleMapsApiKey = "AIzaSyDGjMGV-nIu_BXJb9fa6xrWYg0WctXtmc0";
  static const apiUrl = "https://app.loadconnect.ng/api/v1";
}


const userDataBox = 'user-data-box';
const userIdKey = 'user-id-key';
const userTokenKey = 'user-token-key';

const appDataBox = 'app-data-box';
const loggedInBeforeKey = 'logged-in-before-key';


const String selectLoadLocationScreen = Routes.selectLoadLocation;
const String addLoadDetailScreen = Routes.addLoadDetails;
const String addLoadImageScreen = Routes.addLoadImages;
const String addLoadReceiverInfoScreen = Routes.loadReceiverInfo;
const String addOtherLoadInfoScreen = Routes.otherLoadInfo;


/// Load Status
const pendingLoadStatus = 'pending';


const requireTokenHeader = {
  "requireToken": true
};

Map<String, int> loadStatusMap = {
  "created": 1,
  "negotiating": 2,
  "ready_for_pickup": 3,
  "out_for_delivery": 4,
  "delivered": 5
};