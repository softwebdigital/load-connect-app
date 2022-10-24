/// id : "693b5458-c044-4b6d-9d98-1827a94d7b15"
/// user_id : "d32640d9-2fd6-41a2-88df-5b5dbb8d78eb"
/// pickup_location_coordinate : {"type":"Point","coordinates":[5.235415,7.615736]}
/// destination_coordinate : {"type":"Point","coordinates":[5.235415,7.615736]}
/// description : "load description"
/// load_value : "5500"
/// load_weight : "4"
/// truck_category : "mini-truck"
/// truck_capacity : "heavy"
/// receiver_name : "John Snow"
/// receiver_phone : "12345678900"
/// pickup_date : "2022-10-14T00:00:00.000000Z"
/// pickup_deadline_date : "2022-10-16T00:00:00.000000Z"
/// status : "created"
/// created_at : "2022-10-14T16:34:10.000000Z"
/// updated_at : "2022-10-14T16:34:10.000000Z"
/// estimated_fee : ""
/// pricing_offer : null
/// loadimages : [{"id":"13c5c095-3b9c-4734-b0a1-28b7c6dd7c0f","user_load_id":"693b5458-c044-4b6d-9d98-1827a94d7b15","url":"http://127.0.0.1:8000/images/202210141634Screenshot-2022-08-05-at-4.16.51-PM.png","created_at":"2022-10-14T16:34:10.000000Z","updated_at":"2022-10-14T16:34:10.000000Z"},{"id":"a7d148f4-1a3b-44e1-93ef-8e197cea3415","user_load_id":"693b5458-c044-4b6d-9d98-1827a94d7b15","url":"http://127.0.0.1:8000/images/202210141634Screenshot-2022-08-06-at-1.16.36-PM.png","created_at":"2022-10-14T16:34:10.000000Z","updated_at":"2022-10-14T16:34:10.000000Z"}]

class UserLoad {
  UserLoad({
      this.id, 
      this.userId, 
      this.pickupLocationCoordinate, 
      this.destinationCoordinate, 
      this.description, 
      this.loadValue, 
      this.loadWeight, 
      this.truckCategory, 
      this.truckCapacity, 
      this.receiverName, 
      this.receiverPhone, 
      this.pickupDate, 
      this.pickupDeadlineDate, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.estimatedFee, 
      this.pricingOffer, 
      this.pickupLocation,
      this.destination,
      this.loadimages,});

  UserLoad.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    pickupLocationCoordinate = json['pickup_location_coordinate'] != null ? PickupLocationCoordinate.fromJson(json['pickup_location_coordinate']) : null;
    destinationCoordinate = json['destination_coordinate'] != null ? DestinationCoordinate.fromJson(json['destination_coordinate']) : null;
    description = json['description'];
    loadValue = json['load_value'];
    loadWeight = json['load_weight'];
    truckCategory = json['truck_category'];
    truckCapacity = json['truck_capacity'];
    receiverName = json['receiver_name'];
    receiverPhone = json['receiver_phone'];
    pickupDate = json['pickup_date'];
    pickupDeadlineDate = json['pickup_deadline_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    estimatedFee = json['estimated_fee'];
    pricingOffer = json['pricing_offer'];
    pickupLocation = json['pickup_location'];
    destination = json['destination'];
    if (json['loadimages'] != null) {
      loadimages = [];
      json['loadimages'].forEach((v) {
        loadimages?.add(Loadimages.fromJson(v));
      });
    }
  }
  String? id;
  String? userId;
  PickupLocationCoordinate? pickupLocationCoordinate;
  DestinationCoordinate? destinationCoordinate;
  String? description;
  String? loadValue;
  String? loadWeight;
  String? truckCategory;
  String? truckCapacity;
  String? receiverName;
  String? receiverPhone;
  String? pickupDate;
  String? pickupDeadlineDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? estimatedFee;
  String? destination;
  String? pickupLocation;
  dynamic pricingOffer;
  List<Loadimages>? loadimages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    if (pickupLocationCoordinate != null) {
      map['pickup_location_coordinate'] = pickupLocationCoordinate?.toJson();
    }
    if (destinationCoordinate != null) {
      map['destination_coordinate'] = destinationCoordinate?.toJson();
    }
    map['description'] = description;
    map['load_value'] = loadValue;
    map['load_weight'] = loadWeight;
    map['truck_category'] = truckCategory;
    map['truck_capacity'] = truckCapacity;
    map['receiver_name'] = receiverName;
    map['receiver_phone'] = receiverPhone;
    map['pickup_date'] = pickupDate;
    map['pickup_deadline_date'] = pickupDeadlineDate;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['estimated_fee'] = estimatedFee;
    map['pricing_offer'] = pricingOffer;
    map['destination'] = destination;
    map['pickup_location'] = pickupLocation;
    if (loadimages != null) {
      map['loadimages'] = loadimages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "13c5c095-3b9c-4734-b0a1-28b7c6dd7c0f"
/// user_load_id : "693b5458-c044-4b6d-9d98-1827a94d7b15"
/// url : "http://127.0.0.1:8000/images/202210141634Screenshot-2022-08-05-at-4.16.51-PM.png"
/// created_at : "2022-10-14T16:34:10.000000Z"
/// updated_at : "2022-10-14T16:34:10.000000Z"

class Loadimages {
  Loadimages({
      this.id, 
      this.userLoadId, 
      this.url, 
      this.createdAt, 
      this.updatedAt,});

  Loadimages.fromJson(dynamic json) {
    id = json['id'];
    userLoadId = json['user_load_id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? userLoadId;
  String? url;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_load_id'] = userLoadId;
    map['url'] = url;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// type : "Point"
/// coordinates : [5.235415,7.615736]

class DestinationCoordinate {
  DestinationCoordinate({
      this.type, 
      this.coordinates,});

  DestinationCoordinate.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}

/// type : "Point"
/// coordinates : [5.235415,7.615736]

class PickupLocationCoordinate {
  PickupLocationCoordinate({
      this.type, 
      this.coordinates,});

  PickupLocationCoordinate.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}