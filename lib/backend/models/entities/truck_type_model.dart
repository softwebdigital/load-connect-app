/// id : "c8b4ba2b-ec40-447b-b1fa-fec847fa076c"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// title : "Large Truck"
/// slug : "large-truck"
/// created_at : "2022-11-25T12:22:57.000000Z"
/// updated_at : "2022-11-25T12:22:57.000000Z"

class TruckTypeModel {
  TruckTypeModel({
      this.id, 
      this.userId, 
      this.title, 
      this.slug, 
      this.createdAt, 
      this.updatedAt,});

  TruckTypeModel.fromJson(dynamic json) {
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