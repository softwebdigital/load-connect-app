/// first_name : "me"
/// last_name : "you"
/// email : "menyou@mailinator.com"
/// phone_number : "08088888888"
/// user_type : "dispatch"
/// updated_at : "2022-06-23T14:54:39.000000Z"
/// created_at : "2022-06-23T14:54:39.000000Z"
/// id : 4
/// profile_photo_url : "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF"
/// more : null
/// uid : "eyJpdiI6IjBhYUFaRjRzNEV1ZXIwVHNXcFFiV1E9PSIsInZhbHVlIjoiTStvWG04VUdXSHhRajllbzhsZEsvdz09IiwibWFjIjoiMjJhNWM4ZmI3ZDkwN2ViOTFmYTMzZTJjYWI0ZjI4OTQxYjYyNzVkMjU0NDc3ZWVlNjM2ZTFhMjZmOGMxMzRhZiIsInRhZyI6IiJ9"
/// full_ratings : 0
/// roles : [{"id":3,"name":"rider","guard_name":"web","created_at":"2022-05-16T22:57:42.000000Z","updated_at":"2022-05-16T22:57:42.000000Z","pivot":{"model_id":4,"role_id":3,"model_type":"App\\Models\\User"}}]

class UserModel {
  UserModel({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.userType, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.profilePhotoUrl, 
      this.more, 
      this.uid, 
      this.fullRatings, 
      this.roles,});

  UserModel.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    userType = json['user_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    profilePhotoUrl = json['profile_photo_url'];
    more = json['more'];
    uid = json['uid'];
    fullRatings = json['full_ratings'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? userType;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? profilePhotoUrl;
  dynamic more;
  String? uid;
  int? fullRatings;
  List<Roles>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['user_type'] = userType;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['profile_photo_url'] = profilePhotoUrl;
    map['more'] = more;
    map['uid'] = uid;
    map['full_ratings'] = fullRatings;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// name : "rider"
/// guard_name : "web"
/// created_at : "2022-05-16T22:57:42.000000Z"
/// updated_at : "2022-05-16T22:57:42.000000Z"
/// pivot : {"model_id":4,"role_id":3,"model_type":"App\\Models\\User"}

class Roles {
  Roles({
      this.id, 
      this.name, 
      this.guardName, 
      this.createdAt, 
      this.updatedAt, 
      this.pivot,});

  Roles.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['guard_name'] = guardName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

/// model_id : 4
/// role_id : 3
/// model_type : "App\\Models\\User"

class Pivot {
  Pivot({
      this.modelId, 
      this.roleId, 
      this.modelType,});

  Pivot.fromJson(dynamic json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }
  int? modelId;
  int? roleId;
  String? modelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model_id'] = modelId;
    map['role_id'] = roleId;
    map['model_type'] = modelType;
    return map;
  }

}