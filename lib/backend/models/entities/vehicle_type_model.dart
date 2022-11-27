/// id : "4a239025-6f93-4c1b-b07b-269f6ea35dfd"
/// user_id : "05646305-1d35-4985-bb14-58799fae0d69"
/// avatar : "http://127.0.0.1:8000/images/202211081819Screenshot-2022-08-06-at-12.21.43-PM.png"
/// title : "pickup Truck"
/// description : "a new mini truck category"
/// created_at : "2022-11-08T18:19:50.000000Z"
/// updated_at : "2022-11-08T18:19:50.000000Z"

class VehicleTypeModel {
  VehicleTypeModel({
      this.id, 
      this.userId, 
      this.avatar, 
      this.title, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  VehicleTypeModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    avatar = json['avatar'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? userId;
  String? avatar;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['avatar'] = avatar;
    map['title'] = title;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}