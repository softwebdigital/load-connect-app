/// id : "44ed8d47-c13c-4756-9799-022e3fdda6ea"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// avatar : "http://127.0.0.1:8000/images/202211251209Screenshot-2022-08-03-at-7.57.41-PM.png"
/// title : "Large Truck"
/// slug : "large-truck"
/// description : "a new large truck category"
/// created_at : "2022-11-25T12:09:16.000000Z"
/// updated_at : "2022-11-25T12:09:16.000000Z"

class TruckCategoryModel {
  TruckCategoryModel({
      this.id, 
      this.userId, 
      this.avatar, 
      this.title, 
      this.slug, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  TruckCategoryModel.fromJson(dynamic json) {
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