class AppData {
  static const appName = "Load Connect";
  static const googleMapsApiKey = "AIzaSyCGD0gE33dc-6UHtIAptXSAVZRogFvV8Hs";
  static const apiUrl = "http://137.184.146.138/api/v1";
}


const userDataBox = 'user-data-box';
const userIdKey = 'user-id-key';
const userTokenKey = 'user-token-key';

const appDataBox = 'app-data-box';
const loggedInBeforeKey = 'logged-in-before-key';

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