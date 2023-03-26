/// chats : [{"id":"44cce410-0ff3-4f2c-b199-6da545421ea8","user_id":"55e312f7-1a97-42c1-afb4-6415d6d64358","sent_to":"55e312f7-1a97-42c1-afb4-6415d6d64358","message":"Hello chief","created_at":"2022-12-14T10:21:57.000000Z","updated_at":"2022-12-14T10:21:57.000000Z","is_seen":0,"user_message_attachment":[{"id":"196b4d6a-1c5f-471a-baf8-cacbc347fe27","user_message_id":"44cce410-0ff3-4f2c-b199-6da545421ea8","image":"http://127.0.0.1:8000/images/202212141021Screenshot-2022-08-06-at-1.21.53-PM.png","created_at":"2022-12-14T10:21:57.000000Z","updated_at":"2022-12-14T10:21:57.000000Z"},{"id":"8ae1d3ce-70d8-49c8-a816-ab0bc2724f24","user_message_id":"44cce410-0ff3-4f2c-b199-6da545421ea8","image":"http://127.0.0.1:8000/images/202212141021Screenshot-2022-08-06-at-12.16.05-PM.png","created_at":"2022-12-14T10:21:57.000000Z","updated_at":"2022-12-14T10:21:57.000000Z"}]},{"id":"a0b0f38d-4869-4a47-ab5e-f5fc81c96c94","user_id":"55e312f7-1a97-42c1-afb4-6415d6d64358","sent_to":"55e312f7-1a97-42c1-afb4-6415d6d64358","message":"Hi, how are you doing?","created_at":"2022-12-14T10:27:32.000000Z","updated_at":"2022-12-14T10:27:32.000000Z","is_seen":0,"user_message_attachment":[{"id":"233b6615-207d-4200-a5e4-8451b17822a0","user_message_id":"a0b0f38d-4869-4a47-ab5e-f5fc81c96c94","image":"http://127.0.0.1:8000/images/202212141027Screenshot-2022-08-06-at-12.16.05-PM.png","created_at":"2022-12-14T10:27:32.000000Z","updated_at":"2022-12-14T10:27:32.000000Z"},{"id":"51e56023-2779-4a39-8f83-e2a13bb62636","user_message_id":"a0b0f38d-4869-4a47-ab5e-f5fc81c96c94","image":"http://127.0.0.1:8000/images/202212141027Screenshot-2022-08-06-at-1.21.53-PM.png","created_at":"2022-12-14T10:27:32.000000Z","updated_at":"2022-12-14T10:27:32.000000Z"}]}]
/// seen : true

class ChatMessagesModel {
  ChatMessagesModel({
    this.chats,
    this.seen,});

  ChatMessagesModel.fromJson(dynamic json) {
    if (json['chats'] != null) {
      chats = [];
      json['chats'].forEach((v) {
        chats?.add(Chats.fromJson(v));
      });
    }
    seen = json['seen'];
  }
  List<Chats>? chats;
  bool? seen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chats != null) {
      map['chats'] = chats?.map((v) => v.toJson()).toList();
    }
    map['seen'] = seen;
    return map;
  }

}

/// id : "44cce410-0ff3-4f2c-b199-6da545421ea8"
/// user_id : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// sent_to : "55e312f7-1a97-42c1-afb4-6415d6d64358"
/// message : "Hello chief"
/// created_at : "2022-12-14T10:21:57.000000Z"
/// updated_at : "2022-12-14T10:21:57.000000Z"
/// is_seen : 0
/// user_message_attachment : [{"id":"196b4d6a-1c5f-471a-baf8-cacbc347fe27","user_message_id":"44cce410-0ff3-4f2c-b199-6da545421ea8","image":"http://127.0.0.1:8000/images/202212141021Screenshot-2022-08-06-at-1.21.53-PM.png","created_at":"2022-12-14T10:21:57.000000Z","updated_at":"2022-12-14T10:21:57.000000Z"},{"id":"8ae1d3ce-70d8-49c8-a816-ab0bc2724f24","user_message_id":"44cce410-0ff3-4f2c-b199-6da545421ea8","image":"http://127.0.0.1:8000/images/202212141021Screenshot-2022-08-06-at-12.16.05-PM.png","created_at":"2022-12-14T10:21:57.000000Z","updated_at":"2022-12-14T10:21:57.000000Z"}]

class Chats {
  Chats({
    this.id,
    this.userId,
    this.sentTo,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.isSeen,
    this.userMessageAttachment,});

  Chats.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    sentTo = json['sent_to'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSeen = json['is_seen'];
    if (json['user_message_attachment'] != null) {
      userMessageAttachment = [];
      json['user_message_attachment'].forEach((v) {
        userMessageAttachment?.add(UserMessageAttachment.fromJson(v));
      });
    }
  }
  String? id;
  String? userId;
  String? sentTo;
  String? message;
  String? createdAt;
  String? updatedAt;
  num? isSeen;
  List<UserMessageAttachment>? userMessageAttachment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['sent_to'] = sentTo;
    map['message'] = message;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_seen'] = isSeen;
    if (userMessageAttachment != null) {
      map['user_message_attachment'] = userMessageAttachment?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "196b4d6a-1c5f-471a-baf8-cacbc347fe27"
/// user_message_id : "44cce410-0ff3-4f2c-b199-6da545421ea8"
/// image : "http://127.0.0.1:8000/images/202212141021Screenshot-2022-08-06-at-1.21.53-PM.png"
/// created_at : "2022-12-14T10:21:57.000000Z"
/// updated_at : "2022-12-14T10:21:57.000000Z"

class UserMessageAttachment {
  UserMessageAttachment({
    this.id,
    this.userMessageId,
    this.image,
    this.createdAt,
    this.updatedAt,});

  UserMessageAttachment.fromJson(dynamic json) {
    id = json['id'];
    userMessageId = json['user_message_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? userMessageId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_message_id'] = userMessageId;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}