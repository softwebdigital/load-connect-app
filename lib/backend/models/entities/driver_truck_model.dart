/// id : "a1e58fe2-0db1-41fd-b3ff-e18fd82ed168"
/// user_id : "cebbc733-9310-4936-b18e-2c51a0e41860"
/// name : "Staff Truck"
/// plate_number : "YH1482JSS"
/// category : "large truck"
/// sub_category : "open truck"
/// max_length : "2000"
/// max_weight : "25"
/// created_at : "2022-11-01T10:45:41.000000Z"
/// updated_at : "2022-11-01T10:45:41.000000Z"
/// status : null
/// truck_documents : [{"id":"0ac35158-9f71-46fb-9308-46eac2f0c5bb","truck_id":"a1e58fe2-0db1-41fd-b3ff-e18fd82ed168","url":"http://127.0.0.1:8000/images/202211011045Screenshot-2022-08-06-at-12.16.05-PM.png","type":"image","created_at":"2022-11-01T10:45:41.000000Z","updated_at":"2022-11-01T10:45:41.000000Z"},{"id":"ea948640-dd06-4e71-ba82-275f124e4003","truck_id":"a1e58fe2-0db1-41fd-b3ff-e18fd82ed168","url":"http://127.0.0.1:8000/images/202211011045Screenshot-2022-08-06-at-12.21.43-PM.png","type":"image","created_at":"2022-11-01T10:45:41.000000Z","updated_at":"2022-11-01T10:45:41.000000Z"},{"id":"05a9889f-5076-4025-861a-1190f8192e21","truck_id":"a1e58fe2-0db1-41fd-b3ff-e18fd82ed168","url":"http://127.0.0.1:8000/images/202211011045Screenshot-2022-09-09-at-11.42.06-PM.png","type":"document","created_at":"2022-11-01T10:45:41.000000Z","updated_at":"2022-11-01T10:45:41.000000Z"},{"id":"fcfcf166-c7b4-4695-aa21-7f5f27da2995","truck_id":"a1e58fe2-0db1-41fd-b3ff-e18fd82ed168","url":"http://127.0.0.1:8000/images/202211011045Screenshot-2022-09-14-at-11.20.02-AM.png","type":"document","created_at":"2022-11-01T10:45:41.000000Z","updated_at":"2022-11-01T10:45:41.000000Z"},{"id":"74d53cc0-2a0b-4d0e-873b-5ad6b66cbfd4","truck_id":"a1e58fe2-0db1-41fd-b3ff-e18fd82ed168","url":"http://127.0.0.1:8000/images/202211011045Screenshot-2022-09-21-at-4.34.19-PM.png","type":"document","created_at":"2022-11-01T10:45:41.000000Z","updated_at":"2022-11-01T10:45:41.000000Z"}]

class DriverTruckModel {
  DriverTruckModel({
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
      this.truckDocuments,});

  DriverTruckModel.fromJson(dynamic json) {
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
  dynamic status;
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
    if (truckDocuments != null) {
      map['truck_documents'] = truckDocuments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "0ac35158-9f71-46fb-9308-46eac2f0c5bb"
/// truck_id : "a1e58fe2-0db1-41fd-b3ff-e18fd82ed168"
/// url : "http://127.0.0.1:8000/images/202211011045Screenshot-2022-08-06-at-12.16.05-PM.png"
/// type : "image"
/// created_at : "2022-11-01T10:45:41.000000Z"
/// updated_at : "2022-11-01T10:45:41.000000Z"

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