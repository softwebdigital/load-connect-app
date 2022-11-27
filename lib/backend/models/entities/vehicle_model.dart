import 'package:load_connect/backend/models/entities/user_model.dart';

/// id : "89547501-2015-42a3-a776-c76723507d11"
/// user_id : "cebbc733-9310-4936-b18e-2c51a0e41860"
/// name : "Staff Truck"
/// plate_number : "YH1482JSS"
/// category : "large truck"
/// sub_category : "open truck"
/// max_length : "2000"
/// max_weight : "25"
/// created_at : "2022-11-01T11:22:07.000000Z"
/// updated_at : "2022-11-01T11:22:07.000000Z"
/// status : "pending"
/// truck_documents : [{"id":"3f7b017b-1679-4b1e-a394-662d0c9f6433","truck_id":"89547501-2015-42a3-a776-c76723507d11","url":"http://127.0.0.1:8000/images/202211011122Screenshot-2022-08-06-at-12.16.05-PM.png","type":"image","created_at":"2022-11-01T11:22:07.000000Z","updated_at":"2022-11-01T11:22:07.000000Z"},{"id":"2684a52d-073b-445f-a0ad-2d6b6ba47821","truck_id":"89547501-2015-42a3-a776-c76723507d11","url":"http://127.0.0.1:8000/images/202211011122Screenshot-2022-08-06-at-12.21.43-PM.png","type":"image","created_at":"2022-11-01T11:22:07.000000Z","updated_at":"2022-11-01T11:22:07.000000Z"},{"id":"5035cb3c-573f-4237-858d-6e652bbd4f44","truck_id":"89547501-2015-42a3-a776-c76723507d11","url":"http://127.0.0.1:8000/images/202211011122Screenshot-2022-09-09-at-11.42.06-PM.png","type":"document","created_at":"2022-11-01T11:22:07.000000Z","updated_at":"2022-11-01T11:22:07.000000Z"},{"id":"4200179f-e957-435e-b420-d155a4d98530","truck_id":"89547501-2015-42a3-a776-c76723507d11","url":"http://127.0.0.1:8000/images/202211011122Screenshot-2022-09-14-at-11.20.02-AM.png","type":"document","created_at":"2022-11-01T11:22:07.000000Z","updated_at":"2022-11-01T11:22:07.000000Z"},{"id":"1b8880ae-2fb1-4d82-b1cb-a605f993c77b","truck_id":"89547501-2015-42a3-a776-c76723507d11","url":"http://127.0.0.1:8000/images/202211011122Screenshot-2022-09-21-at-4.34.19-PM.png","type":"document","created_at":"2022-11-01T11:22:07.000000Z","updated_at":"2022-11-01T11:22:07.000000Z"}]

class VehicleModel {
  VehicleModel({
      this.id, 
      this.userId, 
      this.name, 
      this.plateNumber, 
      this.category, 
      this.subCategory, 
      this.maxLength, 
      this.maxWeight, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.user,
      this.truckDocuments,});

  VehicleModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    plateNumber = json['plate_number'];
    category = json['category'];
    subCategory = json['sub_category'];
    maxLength = json['max_length'];
    maxWeight = json['max_weight'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    if (json['truck_documents'] != null) {
      truckDocuments = [];
      json['truck_documents'].forEach((v) {
        truckDocuments?.add(TruckDocuments.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = UserModel.fromJson(json['user']);
    }

  }
  String? id;
  String? userId;
  String? name;
  String? plateNumber;
  String? category;
  String? subCategory;
  String? maxLength;
  String? maxWeight;
  String? createdAt;
  String? updatedAt;
  String? status;
  UserModel? user;
  List<TruckDocuments>? truckDocuments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['plate_number'] = plateNumber;
    map['category'] = category;
    map['sub_category'] = subCategory;
    map['max_length'] = maxLength;
    map['max_weight'] = maxWeight;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['status'] = status;
    if (user != null) {
      map['user'] = user!.toJson();
    }

    if (truckDocuments != null) {
      map['truck_documents'] = truckDocuments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "3f7b017b-1679-4b1e-a394-662d0c9f6433"
/// truck_id : "89547501-2015-42a3-a776-c76723507d11"
/// url : "http://127.0.0.1:8000/images/202211011122Screenshot-2022-08-06-at-12.16.05-PM.png"
/// type : "image"
/// created_at : "2022-11-01T11:22:07.000000Z"
/// updated_at : "2022-11-01T11:22:07.000000Z"

class TruckDocuments {
  TruckDocuments({
      this.id, 
      this.truckId, 
      this.url, 
      this.type, 
      this.createdAt, 
      this.updatedAt,});

  TruckDocuments.fromJson(dynamic json) {
    id = json['id'];
    truckId = json['truck_id'];
    url = json['url'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? truckId;
  String? url;
  String? type;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['truck_id'] = truckId;
    map['url'] = url;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}