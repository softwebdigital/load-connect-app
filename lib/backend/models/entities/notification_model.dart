/// id : "a00c263d-7519-407f-9871-107f680f8291"
/// type : "App\\Notifications\\OfferReceived"
/// notifiable_type : "App\\Models\\User"
/// notifiable_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// data : {"title":"You have received an offer from Miracle Gabriel","content":"You have been given an offer for your load....check"}
/// read_at : null
/// created_at : "2022-12-01T14:00:41.000000Z"
/// updated_at : "2022-12-01T14:00:41.000000Z"

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
  String? notifiableId;
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

/// title : "You have received an offer from Miracle Gabriel"
/// content : "You have been given an offer for your load....check"

class Data {
  Data({
    this.title,
    this.content,});

  Data.fromJson(dynamic json) {
    title = json['title'];
    content = json['content'];
  }
  String? title;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['content'] = content;
    return map;
  }

}