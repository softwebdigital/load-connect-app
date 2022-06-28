import 'package:load_connect/backend/models/entities/vehicle_model.dart';

/// id : 1
/// name : "Sample Truck"
/// icon : "fas fa-truck"
/// estimated_capacity_per_kilometre_price : 5
/// created_at : "2022-05-16T23:54:35.000000Z"
/// updated_at : "2022-05-16T23:54:35.000000Z"
/// vehicles : [{"id":1,"user_id":3,"name":"Corrolla 20156 BTGF 5653 Role 2","status":"approved","notes":null,"is_available":1,"is_blacklisted":0,"current_latitude":6.5247011,"current_longitude":3.2391214,"current_address":null,"created_at":"2022-05-17T00:20:03.000000Z","updated_at":"2022-05-17T00:24:46.000000Z","more":{"color":"green","plate_number":"HGTY678","capacity_per_kilometre_price":10000},"uid":"eyJpdiI6IlpoU242b2pZZnFmR0lEbHFqSnZlbnc9PSIsInZhbHVlIjoiWDVjSFJoTmlVcHhNelpKTXk0d0M5QT09IiwibWFjIjoiNjYzYTE1NDgxM2QxMjlmMjQ3Njg1ZTE1NjdjOWQ4NDY4ZjlkZTNhYmFiYWQ2YzkyN2QyNmY5MjczNzA5MmRiNyIsInRhZyI6IiJ9","pivot":{"vehicle_type_id":1,"vehicle_id":1,"created_at":"2022-05-17T00:20:03.000000Z","updated_at":"2022-05-17T00:20:03.000000Z"},"user":{"id":3,"first_name":"Jay","last_name":"Ayo","email":"dawodubabatundecharming@gmail.com","phone_number":"07013117252","email_verified_at":"2022-05-17T00:09:47.000000Z","is_admin":0,"is_active":1,"firebase_token":"dydhdydjmd===djhd65yrjhdbdd","user_type":"dispatch","current_team_id":null,"profile_photo_path":"profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG","created_at":"2022-05-17T00:01:28.000000Z","updated_at":"2022-05-17T00:19:56.000000Z","profile_photo_url":"https://app.loadconnect.ng/storage/profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG","more":{"state":"Lagos","address":"7 lateef fagbemi","nationality":"nigeria","date_of_birth":"1992-04-17","next_kin_name":"Ololade Dawodu","driver_license":"driver-licenses/otzi3LKSNydi8LfijftycyBTC.jpeg","guarantor_name":"Abimbola Oshin","gurantor_address":"7 oshinfolawe Ijebu Ifon","local_government":"Shomolu","next_kin_address":"Fowobi, 10 Ogun state","guarantor_passport":"guarantor-licenses/o5iKy00ITcU0Ck3JSkGdGxeaM.JPG","next_kin_phone_number":"08056575885","next_kin_relationship":"brother","guarantor_phone_number":"09013117251","is_guarantor_confirmed":true},"uid":"eyJpdiI6Im9CTkJsYnJIaXpJbi9waVNPSTlsdFE9PSIsInZhbHVlIjoiMmhodVBqdGdSam9Yc2dRRkhlUUxLUT09IiwibWFjIjoiYTcwMjNlNzc0MDk2MWJiMmJjOWE3ZDI4NTM3YmUwMzM5N2RjNmMwYTQ2ZGVlMDkyZTY5MjI5OTA5NjY3ODBiNiIsInRhZyI6IiJ9","full_ratings":0}}]

class VehicleTypeModel {
  VehicleTypeModel({
      this.id, 
      this.name, 
      this.icon, 
      this.estimatedCapacityPerKilometrePrice, 
      this.createdAt, 
      this.updatedAt, 
      this.vehicles,});

  VehicleTypeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    estimatedCapacityPerKilometrePrice = json['estimated_capacity_per_kilometre_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add(VehicleModel.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? icon;
  int? estimatedCapacityPerKilometrePrice;
  String? createdAt;
  String? updatedAt;
  List<VehicleModel>? vehicles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['estimated_capacity_per_kilometre_price'] = estimatedCapacityPerKilometrePrice;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (vehicles != null) {
      map['vehicles'] = vehicles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}