import 'package:load_connect/backend/models/entities/notification_model.dart';
import 'package:load_connect/backend/models/entities/order_model.dart';
import 'package:load_connect/backend/models/entities/wallet_model.dart';

/// user : {"id":4,"first_name":"me","last_name":"you","email":"menyou@mailinator.com","phone_number":"08088888888","email_verified_at":"2022-06-24T01:35:12.000000Z","is_admin":0,"is_active":1,"firebase_token":null,"user_type":"dispatch","current_team_id":null,"profile_photo_path":null,"created_at":"2022-06-23T14:54:39.000000Z","updated_at":"2022-06-24T01:35:12.000000Z","profile_photo_url":"https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF","more":null,"uid":"eyJpdiI6IlU2ZjlySXd6dnQxQnNGSUZNUWF1Rmc9PSIsInZhbHVlIjoiS2xPY29TaHRIdFZQQkpxVlp1Zk93UT09IiwibWFjIjoiNmY0MDIyMjViZGI0OGExNjRjNDk2MDQ5ZmRmZGI3ZjllMTQ2YTYyN2UxMzgzMTFjYzJiOGRjMzc5NWIzZDdmYiIsInRhZyI6IiJ9","full_ratings":0,"wallet":{"id":3,"user_id":4,"amount":0,"created_at":"2022-06-23T14:54:39.000000Z","updated_at":"2022-06-23T14:54:39.000000Z"},"driver_ratings":[],"transactions":[],"vehicles":[],"payouts":[],"rides":[]}
/// total_transaction : 0
/// unread_notifications : [{"id":"40af1b8f-72c4-4af8-9004-0b97dffea496","type":"App\\Notifications\\GeneralNotification","notifiable_type":"App\\Models\\User","notifiable_id":4,"data":{"body":"Welcome to Load.The rest of welcome messages continue.","icon":"register","title":"Account Registration","is_admin":false},"read_at":null,"created_at":"2022-06-23T14:54:40.000000Z","updated_at":"2022-06-23T14:54:40.000000Z"}]
/// notifications : [{"id":"40af1b8f-72c4-4af8-9004-0b97dffea496","type":"App\\Notifications\\GeneralNotification","notifiable_type":"App\\Models\\User","notifiable_id":4,"data":{"body":"Welcome to Load.The rest of welcome messages continue.","icon":"register","title":"Account Registration","is_admin":false},"read_at":null,"created_at":"2022-06-23T14:54:40.000000Z","updated_at":"2022-06-23T14:54:40.000000Z"}]

class FullProfileModel {
  FullProfileModel({
      this.user, 
      this.totalTransaction, 
      this.unreadNotifications, 
      this.notifications,
  });

  FullProfileModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    totalTransaction = json['total_transaction'];
    if (json['unread_notifications'] != null) {
      unreadNotifications = [];
      json['unread_notifications'].forEach((v) {
        unreadNotifications?.add(NotificationModel.fromJson(v));
      });
    }
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(NotificationModel.fromJson(v));
      });
    }
  }
  User? user;
  int? totalTransaction;
  List<NotificationModel>? unreadNotifications;
  List<NotificationModel>? notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['total_transaction'] = totalTransaction;
    if (unreadNotifications != null) {
      map['unread_notifications'] = unreadNotifications?.map((v) => v.toJson()).toList();
    }
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


/// id : 4
/// first_name : "me"
/// last_name : "you"
/// email : "menyou@mailinator.com"
/// phone_number : "08088888888"
/// email_verified_at : "2022-06-24T01:35:12.000000Z"
/// is_admin : 0
/// is_active : 1
/// firebase_token : null
/// user_type : "dispatch"
/// current_team_id : null
/// profile_photo_path : null
/// created_at : "2022-06-23T14:54:39.000000Z"
/// updated_at : "2022-06-24T01:35:12.000000Z"
/// profile_photo_url : "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF"
/// more : null
/// uid : "eyJpdiI6IlU2ZjlySXd6dnQxQnNGSUZNUWF1Rmc9PSIsInZhbHVlIjoiS2xPY29TaHRIdFZQQkpxVlp1Zk93UT09IiwibWFjIjoiNmY0MDIyMjViZGI0OGExNjRjNDk2MDQ5ZmRmZGI3ZjllMTQ2YTYyN2UxMzgzMTFjYzJiOGRjMzc5NWIzZDdmYiIsInRhZyI6IiJ9"
/// full_ratings : 0
/// wallet : {"id":3,"user_id":4,"amount":0,"created_at":"2022-06-23T14:54:39.000000Z","updated_at":"2022-06-23T14:54:39.000000Z"}
/// driver_ratings : []
/// transactions : []
/// vehicles : []
/// payouts : []
/// rides : []

class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.emailVerifiedAt, 
      this.isAdmin, 
      this.isActive, 
      this.firebaseToken, 
      this.userType, 
      this.currentTeamId, 
      this.profilePhotoPath, 
      this.createdAt, 
      this.updatedAt, 
      this.profilePhotoUrl, 
      this.more, 
      this.uid, 
      this.fullRatings, 
      this.wallet, 
      this.driverRatings, 
      this.transactions, 
      this.vehicles, 
      this.payouts, 
      this.rides,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    isActive = json['is_active'];
    firebaseToken = json['firebase_token'];
    userType = json['user_type'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
    more = json['more'];
    uid = json['uid'];
    fullRatings = json['full_ratings'];
    wallet = json['wallet'] != null ? WalletModel.fromJson(json['wallet']) : null;
    if (json['driver_ratings'] != null) {
      driverRatings = [];
      json['driver_ratings'].forEach((v) {
        driverRatings?.add((v));
      });
    }
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) {
        transactions?.add((v));
      });
    }
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add((v));
      });
    }
    if (json['payouts'] != null) {
      payouts = [];
      json['payouts'].forEach((v) {
        payouts?.add((v));
      });
    }
    if (json['rides'] != null) {
      rides = [];
      json['rides'].forEach((v) {
        rides?.add((v));
      });
    }
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(OrderModel.fromJson(v));
      });
    }
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  int? isAdmin;
  int? isActive;
  dynamic firebaseToken;
  String? userType;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;
  dynamic more;
  String? uid;
  int? fullRatings;
  WalletModel? wallet;
  List<dynamic>? driverRatings;
  List<dynamic>? transactions;
  List<dynamic>? vehicles;
  List<dynamic>? payouts;
  List<dynamic>? rides;
  List<OrderModel>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['email_verified_at'] = emailVerifiedAt;
    map['is_admin'] = isAdmin;
    map['is_active'] = isActive;
    map['firebase_token'] = firebaseToken;
    map['user_type'] = userType;
    map['current_team_id'] = currentTeamId;
    map['profile_photo_path'] = profilePhotoPath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_photo_url'] = profilePhotoUrl;
    map['more'] = more;
    map['uid'] = uid;
    map['full_ratings'] = fullRatings;
    if (wallet != null) {
      map['wallet'] = wallet?.toJson();
    }
    if (driverRatings != null) {
      map['driver_ratings'] = driverRatings?.map((v) => v.toJson()).toList();
    }
    if (transactions != null) {
      map['transactions'] = transactions?.map((v) => v.toJson()).toList();
    }
    if (vehicles != null) {
      map['vehicles'] = vehicles?.map((v) => v.toJson()).toList();
    }
    if (payouts != null) {
      map['payouts'] = payouts?.map((v) => v.toJson()).toList();
    }
    if (rides != null) {
      map['rides'] = rides?.map((v) => v.toJson()).toList();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}