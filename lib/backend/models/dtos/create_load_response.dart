/// updated_at : "2022-05-16T23:55:36.000000Z"
/// created_at : "2022-05-16T23:55:36.000000Z"
/// id : 1
/// user_id : 2
/// more : {"pickup_address":"7 lateef fagbmei, Lagos","pickup_latitude":"6.5288185","pickup_longitude":"3.3922294","destination_address":"Bridge Credit Limited","destination_latitude":"6.6178493","destination_longitude":"3.3538415","load_name":"Aje Load","load_description":"gdjkd dujdbdd djd\ndhdd dhjdbddjd d hdghdbdvdgd djd","vehicle_type":"bike","receiver_name":"Ayanfe Obadia","receiver_phone_number":"08091919191","capacity":"full","distance":10.77,"estimated_price":53.849999999999994}
/// uid : "eyJpdiI6InRYVGoxQ3ViUDNhdk1tNlB5eDRqT2c9PSIsInZhbHVlIjoiTzU0bnpEd3hBWnNoaHg5ZUlOR1k5Zz09IiwibWFjIjoiZTE3ZDc5MWYzOTAzMDBjNGIzZjFmYThlYmEwNTQ2ZjQ2ZTVjMzY0MWJjNmY5NDYxYzVkZWQ1MmM3MjIwZTA2MCIsInRhZyI6IiJ9"

class CreateLoadResponse {
  CreateLoadResponse({
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.userId, 
      this.more, 
      this.uid,});

  CreateLoadResponse.fromJson(dynamic json) {
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    userId = json['user_id'];
    more = json['more'] != null ? More.fromJson(json['more']) : null;
    uid = json['uid'];
  }
  String? updatedAt;
  String? createdAt;
  int? id;
  int? userId;
  More? more;
  String? uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['user_id'] = userId;
    if (more != null) {
      map['more'] = more?.toJson();
    }
    map['uid'] = uid;
    return map;
  }

}

/// pickup_address : "7 lateef fagbmei, Lagos"
/// pickup_latitude : "6.5288185"
/// pickup_longitude : "3.3922294"
/// destination_address : "Bridge Credit Limited"
/// destination_latitude : "6.6178493"
/// destination_longitude : "3.3538415"
/// load_name : "Aje Load"
/// load_description : "gdjkd dujdbdd djd\ndhdd dhjdbddjd d hdghdbdvdgd djd"
/// vehicle_type : "bike"
/// receiver_name : "Ayanfe Obadia"
/// receiver_phone_number : "08091919191"
/// capacity : "full"
/// distance : 10.77
/// estimated_price : 53.849999999999994

class More {
  More({
      this.pickupAddress, 
      this.pickupLatitude, 
      this.pickupLongitude, 
      this.destinationAddress, 
      this.destinationLatitude, 
      this.destinationLongitude, 
      this.loadName, 
      this.loadDescription, 
      this.vehicleType, 
      this.receiverName, 
      this.receiverPhoneNumber, 
      this.capacity, 
      this.distance, 
      this.estimatedPrice,});

  More.fromJson(dynamic json) {
    pickupAddress = json['pickup_address'];
    pickupLatitude = json['pickup_latitude'];
    pickupLongitude = json['pickup_longitude'];
    destinationAddress = json['destination_address'];
    destinationLatitude = json['destination_latitude'];
    destinationLongitude = json['destination_longitude'];
    loadName = json['load_name'];
    loadDescription = json['load_description'];
    vehicleType = json['vehicle_type'];
    receiverName = json['receiver_name'];
    receiverPhoneNumber = json['receiver_phone_number'];
    capacity = json['capacity'];
    distance = json['distance'];
    estimatedPrice = json['estimated_price'];
  }
  String? pickupAddress;
  String? pickupLatitude;
  String? pickupLongitude;
  String? destinationAddress;
  String? destinationLatitude;
  String? destinationLongitude;
  String? loadName;
  String? loadDescription;
  String? vehicleType;
  String? receiverName;
  String? receiverPhoneNumber;
  String? capacity;
  double? distance;
  double? estimatedPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pickup_address'] = pickupAddress;
    map['pickup_latitude'] = pickupLatitude;
    map['pickup_longitude'] = pickupLongitude;
    map['destination_address'] = destinationAddress;
    map['destination_latitude'] = destinationLatitude;
    map['destination_longitude'] = destinationLongitude;
    map['load_name'] = loadName;
    map['load_description'] = loadDescription;
    map['vehicle_type'] = vehicleType;
    map['receiver_name'] = receiverName;
    map['receiver_phone_number'] = receiverPhoneNumber;
    map['capacity'] = capacity;
    map['distance'] = distance;
    map['estimated_price'] = estimatedPrice;
    return map;
  }

}