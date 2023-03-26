/// id : "41a82461-55e8-4c1d-b726-992a569845dc"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// truck_category_id : "44ed8d47-c13c-4756-9799-022e3fdda6ea"
/// truck_type_id : "c8b4ba2b-ec40-447b-b1fa-fec847fa076c"
/// name : "Staff Truck"
/// slug : null
/// plate_number : "YH1482JSS"
/// category : null
/// sub_category : null
/// max_length : "2000"
/// max_weight : "25"
/// status : "pending"
/// created_at : "2022-11-25T13:15:07.000000Z"
/// updated_at : "2022-11-25T13:15:07.000000Z"
/// truck_documents : [{"id":"92123c89-7690-4514-b213-7a8a122666d0","truck_id":"41a82461-55e8-4c1d-b726-992a569845dc","url":"http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-03-at-7.57.41-PM.png","type":"image","created_at":"2022-11-25T13:15:07.000000Z","updated_at":"2022-11-25T13:15:07.000000Z"},{"id":"3ce8825e-df31-4a7a-b5ef-3c2a26678261","truck_id":"41a82461-55e8-4c1d-b726-992a569845dc","url":"http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-05-at-4.16.51-PM.png","type":"image","created_at":"2022-11-25T13:15:07.000000Z","updated_at":"2022-11-25T13:15:07.000000Z"},{"id":"8978e1b9-2318-4976-807b-d85a36c1cebb","truck_id":"41a82461-55e8-4c1d-b726-992a569845dc","url":"http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-05-at-4.16.51-PM.png","type":"document","created_at":"2022-11-25T13:15:07.000000Z","updated_at":"2022-11-25T13:15:07.000000Z"},{"id":"c1175999-d75c-4cdb-a720-b3732eb3a1d8","truck_id":"41a82461-55e8-4c1d-b726-992a569845dc","url":"http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-06-at-1.16.36-PM.png","type":"document","created_at":"2022-11-25T13:15:07.000000Z","updated_at":"2022-11-25T13:15:07.000000Z"},{"id":"f182ad40-c987-4910-b063-17af01d91a61","truck_id":"41a82461-55e8-4c1d-b726-992a569845dc","url":"http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-06-at-1.21.53-PM.png","type":"document","created_at":"2022-11-25T13:15:07.000000Z","updated_at":"2022-11-25T13:15:07.000000Z"}]
/// user : {"id":"55e312f7-1a97-42c1-afb4-6415d6d64358","first_name":"Miracle","last_name":"Gabriel","email":"sixpathdev@gmail.com","phone":"08141894420","profile_photo":null,"state_of_residence":null,"residential_address":null,"otp":null,"account_verified":1,"account_deactivated":0,"account_type":"user","business_name":null,"cac_number":null,"business_email":null,"business_address":null,"email_verified_at":null,"created_at":"2022-11-25T12:08:43.000000Z","updated_at":"2022-11-25T12:08:56.000000Z"}
/// truck_category : {"id":"44ed8d47-c13c-4756-9799-022e3fdda6ea","user_id":"55e312f7-1a97-42c1-afb4-6415d6d64358","avatar":"http://127.0.0.1:8000/images/202211251209Screenshot-2022-08-03-at-7.57.41-PM.png","title":"Large Truck","slug":"large-truck","description":"a new large truck category","created_at":"2022-11-25T12:09:16.000000Z","updated_at":"2022-11-25T12:09:16.000000Z"}
/// truck_type : {"id":"c8b4ba2b-ec40-447b-b1fa-fec847fa076c","user_id":"55e312f7-1a97-42c1-afb4-6415d6d64358","title":"Large Truck","slug":"large-truck","created_at":"2022-11-25T12:22:57.000000Z","updated_at":"2022-11-25T12:22:57.000000Z"}

class DriverTruckModel {
  DriverTruckModel({
      this.id, 
      this.userId, 
      this.truckCategoryId, 
      this.truckTypeId, 
      this.name, 
      this.slug, 
      this.plateNumber, 
      this.category, 
      this.subCategory, 
      this.maxLength, 
      this.maxWeight, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.truckDocuments, 
      this.user, 
      this.truckCategory, 
      this.truckType,});

  DriverTruckModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    truckCategoryId = json['truck_category_id'];
    truckTypeId = json['truck_type_id'];
    name = json['name'];
    slug = json['slug'];
    plateNumber = json['plate_number'];
    category = json['category'];
    subCategory = json['sub_category'];
    maxLength = json['max_length'];
    maxWeight = json['max_weight'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['truck_documents'] != null) {
      truckDocuments = [];
      json['truck_documents'].forEach((v) {
        truckDocuments?.add(TruckDocuments.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    truckCategory = json['truck_category'] != null ? TruckCategory.fromJson(json['truck_category']) : null;
    truckType = json['truck_type'] != null ? TruckType.fromJson(json['truck_type']) : null;
  }
  String? id;
  String? userId;
  String? truckCategoryId;
  String? truckTypeId;
  String? name;
  dynamic slug;
  String? plateNumber;
  dynamic category;
  dynamic subCategory;
  String? maxLength;
  String? maxWeight;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<TruckDocuments>? truckDocuments;
  User? user;
  TruckCategory? truckCategory;
  TruckType? truckType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['truck_category_id'] = truckCategoryId;
    map['truck_type_id'] = truckTypeId;
    map['name'] = name;
    map['slug'] = slug;
    map['plate_number'] = plateNumber;
    map['category'] = category;
    map['sub_category'] = subCategory;
    map['max_length'] = maxLength;
    map['max_weight'] = maxWeight;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (truckDocuments != null) {
      map['truck_documents'] = truckDocuments?.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (truckCategory != null) {
      map['truck_category'] = truckCategory?.toJson();
    }
    if (truckType != null) {
      map['truck_type'] = truckType?.toJson();
    }
    return map;
  }

}

/// id : "c8b4ba2b-ec40-447b-b1fa-fec847fa076c"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// title : "Large Truck"
/// slug : "large-truck"
/// created_at : "2022-11-25T12:22:57.000000Z"
/// updated_at : "2022-11-25T12:22:57.000000Z"

class TruckType {
  TruckType({
      this.id, 
      this.userId, 
      this.title, 
      this.slug, 
      this.createdAt, 
      this.updatedAt,});

  TruckType.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? userId;
  String? title;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['title'] = title;
    map['slug'] = slug;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : "44ed8d47-c13c-4756-9799-022e3fdda6ea"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// avatar : "http://127.0.0.1:8000/images/202211251209Screenshot-2022-08-03-at-7.57.41-PM.png"
/// title : "Large Truck"
/// slug : "large-truck"
/// description : "a new large truck category"
/// created_at : "2022-11-25T12:09:16.000000Z"
/// updated_at : "2022-11-25T12:09:16.000000Z"

class TruckCategory {
  TruckCategory({
      this.id, 
      this.userId, 
      this.avatar, 
      this.title, 
      this.slug, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  TruckCategory.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    avatar = json['avatar'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? userId;
  String? avatar;
  String? title;
  String? slug;
  String? description;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['avatar'] = avatar;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// first_name : "Miracle"
/// last_name : "Gabriel"
/// email : "sixpathdev@gmail.com"
/// phone : "08141894420"
/// profile_photo : null
/// state_of_residence : null
/// residential_address : null
/// otp : null
/// account_verified : 1
/// account_deactivated : 0
/// account_type : "user"
/// business_name : null
/// cac_number : null
/// business_email : null
/// business_address : null
/// email_verified_at : null
/// created_at : "2022-11-25T12:08:43.000000Z"
/// updated_at : "2022-11-25T12:08:56.000000Z"

class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.profilePhoto, 
      this.stateOfResidence, 
      this.residentialAddress, 
      this.otp, 
      this.accountVerified, 
      this.accountDeactivated, 
      this.accountType, 
      this.businessName, 
      this.cacNumber, 
      this.businessEmail, 
      this.businessAddress, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    profilePhoto = json['profile_photo'];
    stateOfResidence = json['state_of_residence'];
    residentialAddress = json['residential_address'];
    otp = json['otp'];
    accountVerified = json['account_verified'];
    accountDeactivated = json['account_deactivated'];
    accountType = json['account_type'];
    businessName = json['business_name'];
    cacNumber = json['cac_number'];
    businessEmail = json['business_email'];
    businessAddress = json['business_address'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic profilePhoto;
  dynamic stateOfResidence;
  dynamic residentialAddress;
  dynamic otp;
  num? accountVerified;
  num? accountDeactivated;
  String? accountType;
  dynamic businessName;
  dynamic cacNumber;
  dynamic businessEmail;
  dynamic businessAddress;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['profile_photo'] = profilePhoto;
    map['state_of_residence'] = stateOfResidence;
    map['residential_address'] = residentialAddress;
    map['otp'] = otp;
    map['account_verified'] = accountVerified;
    map['account_deactivated'] = accountDeactivated;
    map['account_type'] = accountType;
    map['business_name'] = businessName;
    map['cac_number'] = cacNumber;
    map['business_email'] = businessEmail;
    map['business_address'] = businessAddress;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : "92123c89-7690-4514-b213-7a8a122666d0"
/// truck_id : "41a82461-55e8-4c1d-b726-992a569845dc"
/// url : "http://127.0.0.1:8000/images/202211251315Screenshot-2022-08-03-at-7.57.41-PM.png"
/// type : "image"
/// created_at : "2022-11-25T13:15:07.000000Z"
/// updated_at : "2022-11-25T13:15:07.000000Z"

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