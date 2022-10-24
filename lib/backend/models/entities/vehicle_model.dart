import 'package:load_connect_driver/backend/models/entities/driver_model.dart';

/// id : 1
/// user_id : 3
/// name : "Corrolla 20156 BTGF 5653 Role 2"
/// status : "approved"
/// notes : null
/// is_available : 1
/// is_blacklisted : 0
/// current_latitude : 6.5247011
/// current_longitude : 3.2391214
/// current_address : null
/// created_at : "2022-05-17T00:20:03.000000Z"
/// updated_at : "2022-05-17T00:24:46.000000Z"
/// more : {"color":"green","plate_number":"HGTY678","capacity_per_kilometre_price":10000}
/// uid : "eyJpdiI6IlpoU242b2pZZnFmR0lEbHFqSnZlbnc9PSIsInZhbHVlIjoiWDVjSFJoTmlVcHhNelpKTXk0d0M5QT09IiwibWFjIjoiNjYzYTE1NDgxM2QxMjlmMjQ3Njg1ZTE1NjdjOWQ4NDY4ZjlkZTNhYmFiYWQ2YzkyN2QyNmY5MjczNzA5MmRiNyIsInRhZyI6IiJ9"
/// pivot : {"vehicle_type_id":1,"vehicle_id":1,"created_at":"2022-05-17T00:20:03.000000Z","updated_at":"2022-05-17T00:20:03.000000Z"}
/// user : {"id":3,"first_name":"Jay","last_name":"Ayo","email":"dawodubabatundecharming@gmail.com","phone_number":"07013117252","email_verified_at":"2022-05-17T00:09:47.000000Z","is_admin":0,"is_active":1,"firebase_token":"dydhdydjmd===djhd65yrjhdbdd","user_type":"dispatch","current_team_id":null,"profile_photo_path":"profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG","created_at":"2022-05-17T00:01:28.000000Z","updated_at":"2022-05-17T00:19:56.000000Z","profile_photo_url":"https://app.loadconnect.ng/storage/profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG","more":{"state":"Lagos","address":"7 lateef fagbemi","nationality":"nigeria","date_of_birth":"1992-04-17","next_kin_name":"Ololade Dawodu","driver_license":"driver-licenses/otzi3LKSNydi8LfijftycyBTC.jpeg","guarantor_name":"Abimbola Oshin","gurantor_address":"7 oshinfolawe Ijebu Ifon","local_government":"Shomolu","next_kin_address":"Fowobi, 10 Ogun state","guarantor_passport":"guarantor-licenses/o5iKy00ITcU0Ck3JSkGdGxeaM.JPG","next_kin_phone_number":"08056575885","next_kin_relationship":"brother","guarantor_phone_number":"09013117251","is_guarantor_confirmed":true},"uid":"eyJpdiI6Im9CTkJsYnJIaXpJbi9waVNPSTlsdFE9PSIsInZhbHVlIjoiMmhodVBqdGdSam9Yc2dRRkhlUUxLUT09IiwibWFjIjoiYTcwMjNlNzc0MDk2MWJiMmJjOWE3ZDI4NTM3YmUwMzM5N2RjNmMwYTQ2ZGVlMDkyZTY5MjI5OTA5NjY3ODBiNiIsInRhZyI6IiJ9","full_ratings":0}

class VehicleModel {
  VehicleModel({
      this.id, 
      this.userId, 
      this.name, 
      this.status, 
      this.notes, 
      this.isAvailable, 
      this.isBlacklisted, 
      this.currentLatitude, 
      this.currentLongitude, 
      this.currentAddress, 
      this.createdAt, 
      this.updatedAt, 
      this.more, 
      this.uid, 
      this.pivot, 
      this.user,});

  VehicleModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    status = json['status'];
    notes = json['notes'];
    isAvailable = json['is_available'];
    isBlacklisted = json['is_blacklisted'];
    currentLatitude = json['current_latitude'];
    currentLongitude = json['current_longitude'];
    currentAddress = json['current_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    more = json['more'] != null ? More.fromJson(json['more']) : null;
    uid = json['uid'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? DriverModel.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  String? name;
  String? status;
  dynamic notes;
  int? isAvailable;
  int? isBlacklisted;
  double? currentLatitude;
  double? currentLongitude;
  dynamic currentAddress;
  String? createdAt;
  String? updatedAt;
  More? more;
  String? uid;
  Pivot? pivot;
  DriverModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['status'] = status;
    map['notes'] = notes;
    map['is_available'] = isAvailable;
    map['is_blacklisted'] = isBlacklisted;
    map['current_latitude'] = currentLatitude;
    map['current_longitude'] = currentLongitude;
    map['current_address'] = currentAddress;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (more != null) {
      map['more'] = more?.toJson();
    }
    map['uid'] = uid;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// vehicle_type_id : 1
/// vehicle_id : 1
/// created_at : "2022-05-17T00:20:03.000000Z"
/// updated_at : "2022-05-17T00:20:03.000000Z"

class Pivot {
  Pivot({
      this.vehicleTypeId, 
      this.vehicleId, 
      this.createdAt, 
      this.updatedAt,});

  Pivot.fromJson(dynamic json) {
    vehicleTypeId = json['vehicle_type_id'];
    vehicleId = json['vehicle_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? vehicleTypeId;
  int? vehicleId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicle_type_id'] = vehicleTypeId;
    map['vehicle_id'] = vehicleId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// color : "green"
/// plate_number : "HGTY678"
/// capacity_per_kilometre_price : 10000

class More {
  More({
      this.color, 
      this.plateNumber, 
      this.capacityPerKilometrePrice,});

  More.fromJson(dynamic json) {
    color = json['color'];
    plateNumber = json['plate_number'];
    capacityPerKilometrePrice = json['capacity_per_kilometre_price'];
  }
  String? color;
  String? plateNumber;
  int? capacityPerKilometrePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['plate_number'] = plateNumber;
    map['capacity_per_kilometre_price'] = capacityPerKilometrePrice;
    return map;
  }

}