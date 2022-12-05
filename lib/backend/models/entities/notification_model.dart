/// id : "40af1b8f-72c4-4af8-9004-0b97dffea496"
/// type : "App\\Notifications\\GeneralNotification"
/// notifiable_type : "App\\Models\\User"
/// notifiable_id : 4
/// data : {"body":"Welcome to Load.The rest of welcome messages continue.","icon":"register","title":"Account Registration","is_admin":false}
/// read_at : null
/// created_at : "2022-06-23T14:54:40.000000Z"
/// updated_at : "2022-06-23T14:54:40.000000Z"

class NotificationModel {
  NotificationModel({
      this.id, 
      this.type, 
      this.notifiableType, 
      this.notifiableId, 
      this.data, 
      this.readAt, 
      this.createdAt, 
      this.updatedAt,});

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  dynamic readAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['notifiable_type'] = notifiableType;
    map['notifiable_id'] = notifiableId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['read_at'] = readAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// body : "Welcome to Load.The rest of welcome messages continue."
/// icon : "register"
/// title : "Account Registration"
/// is_admin : false

class Data {
  Data({
      this.body, 
      this.icon, 
      this.title, 
      this.isAdmin,});

  Data.fromJson(dynamic json) {
    body = json['body'];
    icon = json['icon'];
    title = json['title'];
    isAdmin = json['is_admin'];
  }
  String? body;
  String? icon;
  String? title;
  bool? isAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['body'] = body;
    map['icon'] = icon;
    map['title'] = title;
    map['is_admin'] = isAdmin;
    return map;
  }

}
