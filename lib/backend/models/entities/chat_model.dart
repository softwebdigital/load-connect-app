
import 'user_model.dart';

/// id : "44cce410-0ff3-4f2c-b199-6da545421ea8"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// sent_to : {"id":"55e312f7-1a97-42c1-afb4-6415d6d64358","first_name":"Miracle","last_name":"Gabriel","email":"sixpathdev@gmail.com","phone":"08141894420","profile_photo":null,"state_of_residence":null,"residential_address":null,"otp":null,"account_verified":1,"account_deactivated":0,"account_type":"business","business_name":null,"cac_number":null,"business_email":null,"business_address":null,"email_verified_at":null,"created_at":"2022-11-25T12:08:43.000000Z","updated_at":"2022-11-25T12:08:56.000000Z"}
/// message : "Hello chief"
/// created_at : "2022-12-14T10:21:57.000000Z"
/// updated_at : "2022-12-14T10:21:57.000000Z"
/// user : {"id":"55e312f7-1a97-42c1-afb4-6415d6d64358","first_name":"Miracle","last_name":"Gabriel","email":"sixpathdev@gmail.com","phone":"08141894420","profile_photo":null,"state_of_residence":null,"residential_address":null,"otp":null,"account_verified":1,"account_deactivated":0,"account_type":"business","business_name":null,"cac_number":null,"business_email":null,"business_address":null,"email_verified_at":null,"created_at":"2022-11-25T12:08:43.000000Z","updated_at":"2022-11-25T12:08:56.000000Z"}

class ChatModel {
  ChatModel({
    this.id,
    this.userId,
    this.sentTo,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.user,});

  ChatModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    sentTo = json['sent_to'] != null ? UserModel.fromJson(json['sent_to']) : null;
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? id;
  String? userId;
  UserModel? sentTo;
  String? message;
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    if (sentTo != null) {
      map['sent_to'] = sentTo?.toJson();
    }
    map['message'] = message;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

