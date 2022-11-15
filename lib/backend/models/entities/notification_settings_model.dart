/// user_id : "cebbc733-9310-4936-b18e-2c51a0e41860"
/// offer_recieved : 1
/// offer_accepted : 1
/// load_picked_up : 1
/// load_delivered : 1
/// delivery_errors : 1
/// all_messages : 1
/// from_active_loads_only : 1
/// from_load_connect : 1
/// id : "e283b49c-779e-4216-a7d6-b529246211cb"
/// updated_at : "2022-10-26T17:38:27.000000Z"
/// created_at : "2022-10-26T17:38:27.000000Z"

class NotificationSettingsModel {
  NotificationSettingsModel({
    this.userId,
    this.offerRecieved,
    this.offerAccepted,
    this.loadPickedUp,
    this.loadDelivered,
    this.deliveryErrors,
    this.allMessages,
    this.fromActiveLoadsOnly,
    this.fromLoadConnect,
    this.id,
    this.updatedAt,
    this.createdAt,});

  NotificationSettingsModel.fromJson(dynamic json) {
    userId = json['user_id'];
    offerRecieved = json['offer_recieved'];
    offerAccepted = json['offer_accepted'];
    loadPickedUp = json['load_picked_up'];
    loadDelivered = json['load_delivered'];
    deliveryErrors = json['delivery_errors'];
    allMessages = json['all_messages'];
    fromActiveLoadsOnly = json['from_active_loads_only'];
    fromLoadConnect = json['from_load_connect'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
  String? userId;
  num? offerRecieved;
  num? offerAccepted;
  num? loadPickedUp;
  num? loadDelivered;
  num? deliveryErrors;
  num? allMessages;
  num? fromActiveLoadsOnly;
  num? fromLoadConnect;
  String? id;
  String? updatedAt;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['offer_recieved'] = offerRecieved;
    map['offer_accepted'] = offerAccepted;
    map['load_picked_up'] = loadPickedUp;
    map['load_delivered'] = loadDelivered;
    map['delivery_errors'] = deliveryErrors;
    map['all_messages'] = allMessages;
    map['from_active_loads_only'] = fromActiveLoadsOnly;
    map['from_load_connect'] = fromLoadConnect;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }

}