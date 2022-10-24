/// id : 3
/// user_id : 18
/// status : "pending"
/// created_at : "2022-07-08T08:56:51.000000Z"
/// updated_at : "2022-07-08T08:56:51.000000Z"
/// more : {"capacity":"heavy","distance":25.69,"load_name":"vbh","vehicle_type":null,"receiver_name":"ghh","pickup_address":"3 King George V Rd, Lagos Island 102273, Lagos, Nigeria","pickup_latitude":"6.4428356","load_description":"hibgrhjh","pickup_longitude":"3.4028532","destination_address":"104102, Ijede, Nigeria","destination_latitude":"6.5708251","destination_longitude":"3.596457","receiver_phone_number":"08052222222"}
/// uid : "eyJpdiI6IjhKRFQ5YzBOb1VZYWRodzNReFRTYnc9PSIsInZhbHVlIjoiVzc0c3Q2N0lTMXF4NXJlU09BTXRWZz09IiwibWFjIjoiYWEwOWQ4MTEzM2E5MTk2MTBkNDdiMzU0MWViYmJjODJlY2ZhNGUwOWI1N2I2M2FjOTQwZjVjMjFmNzQ0MWZlZiIsInRhZyI6IiJ9"
/// photos : []
/// transactions : []
/// ratings : []
/// vehicles : []
/// prices : []
/// rejected_orders : []

class OrderModel {
  OrderModel({
      this.id, 
      this.userId, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.more, 
      this.uid, 
      this.photos, 
      this.transactions, 
      this.ratings, 
      this.vehicles, 
      this.prices, 
      this.rejectedOrders,});

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    more = json['more'] != null ? More.fromJson(json['more']) : null;
    uid = json['uid'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add((v));
      });
    }
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) {
        transactions?.add((v));
      });
    }
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((v) {
        ratings?.add((v));
      });
    }
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add((v));
      });
    }
    if (json['prices'] != null) {
      prices = [];
      json['prices'].forEach((v) {
        prices?.add((v));
      });
    }
    if (json['rejected_orders'] != null) {
      rejectedOrders = [];
      json['rejected_orders'].forEach((v) {
        rejectedOrders?.add((v));
      });
    }
  }
  int? id;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  More? more;
  String? uid;
  List<dynamic>? photos;
  List<dynamic>? transactions;
  List<dynamic>? ratings;
  List<dynamic>? vehicles;
  List<dynamic>? prices;
  List<dynamic>? rejectedOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (more != null) {
      map['more'] = more?.toJson();
    }
    map['uid'] = uid;
    if (photos != null) {
      map['photos'] = photos;
    }
    if (transactions != null) {
      map['transactions'] = transactions;
    }
    if (ratings != null) {
      map['ratings'] = ratings;
    }
    if (vehicles != null) {
      map['vehicles'] = vehicles;
    }
    if (prices != null) {
      map['prices'] = prices;
    }
    if (rejectedOrders != null) {
      map['rejected_orders'] = rejectedOrders;
    }
    return map;
  }

}

/// capacity : "heavy"
/// distance : 25.69
/// load_name : "vbh"
/// vehicle_type : null
/// receiver_name : "ghh"
/// pickup_address : "3 King George V Rd, Lagos Island 102273, Lagos, Nigeria"
/// pickup_latitude : "6.4428356"
/// load_description : "hibgrhjh"
/// pickup_longitude : "3.4028532"
/// destination_address : "104102, Ijede, Nigeria"
/// destination_latitude : "6.5708251"
/// destination_longitude : "3.596457"
/// receiver_phone_number : "08052222222"

class More {
  More({
      this.capacity, 
      this.distance, 
      this.loadName, 
      this.vehicleType, 
      this.receiverName, 
      this.pickupAddress, 
      this.pickupLatitude, 
      this.loadDescription, 
      this.pickupLongitude, 
      this.destinationAddress, 
      this.destinationLatitude, 
      this.destinationLongitude, 
      this.receiverPhoneNumber,});

  More.fromJson(dynamic json) {
    capacity = json['capacity'];
    distance = json['distance'];
    loadName = json['load_name'];
    vehicleType = json['vehicle_type'];
    receiverName = json['receiver_name'];
    pickupAddress = json['pickup_address'];
    pickupLatitude = json['pickup_latitude'];
    loadDescription = json['load_description'];
    pickupLongitude = json['pickup_longitude'];
    destinationAddress = json['destination_address'];
    destinationLatitude = json['destination_latitude'];
    destinationLongitude = json['destination_longitude'];
    receiverPhoneNumber = json['receiver_phone_number'];
  }
  String? capacity;
  double? distance;
  String? loadName;
  dynamic vehicleType;
  String? receiverName;
  String? pickupAddress;
  String? pickupLatitude;
  String? loadDescription;
  String? pickupLongitude;
  String? destinationAddress;
  String? destinationLatitude;
  String? destinationLongitude;
  String? receiverPhoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['capacity'] = capacity;
    map['distance'] = distance;
    map['load_name'] = loadName;
    map['vehicle_type'] = vehicleType;
    map['receiver_name'] = receiverName;
    map['pickup_address'] = pickupAddress;
    map['pickup_latitude'] = pickupLatitude;
    map['load_description'] = loadDescription;
    map['pickup_longitude'] = pickupLongitude;
    map['destination_address'] = destinationAddress;
    map['destination_latitude'] = destinationLatitude;
    map['destination_longitude'] = destinationLongitude;
    map['receiver_phone_number'] = receiverPhoneNumber;
    return map;
  }

}