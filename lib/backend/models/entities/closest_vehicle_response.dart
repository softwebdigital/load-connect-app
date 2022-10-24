/// code : 200
/// message : "Entries retrieved"
/// status : true
/// data : [{"id":1,"name":"Sample Truck","icon":"fas fa-truck","estimated_capacity_per_kilometre_price":5,"created_at":"2022-05-16T23:54:35.000000Z","updated_at":"2022-05-16T23:54:35.000000Z","vehicles":[]},{"id":2,"name":"Cars","icon":"fas fa-car","estimated_capacity_per_kilometre_price":1000,"created_at":"2022-05-16T23:55:03.000000Z","updated_at":"2022-05-16T23:55:03.000000Z","vehicles":[]}]

class ClosestVehicleResponse {
  ClosestVehicleResponse({
      this.code, 
      this.message, 
      this.status, 
      this.data,});

  ClosestVehicleResponse.fromJson(dynamic json) {
    print("DataSent: $json");
    code = json['code'];
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  String? message;
  bool? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Sample Truck"
/// icon : "fas fa-truck"
/// estimated_capacity_per_kilometre_price : 5
/// created_at : "2022-05-16T23:54:35.000000Z"
/// updated_at : "2022-05-16T23:54:35.000000Z"
/// vehicles : []

class Data {
  Data({
      this.id, 
      this.name, 
      this.icon, 
      this.estimatedCapacityPerKilometrePrice, 
      this.createdAt, 
      this.updatedAt, 
      this.vehicles,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    estimatedCapacityPerKilometrePrice = json['estimated_capacity_per_kilometre_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add((v));
      });
    }
  }
  int? id;
  String? name;
  String? icon;
  int? estimatedCapacityPerKilometrePrice;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? vehicles;

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