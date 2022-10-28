/// offer_recieved : 1
/// offer_accepted : 1
/// load_picked_up : 1
/// load_delivered : 1
/// delivery_errors : 1
/// all_messages : 1
/// from_active_loads_only : 1
/// from_load_connect : 1

class NotificationSettingsRequest {
  NotificationSettingsRequest({
      this.offerRecieved, 
      this.offerAccepted, 
      this.loadPickedUp, 
      this.loadDelivered, 
      this.deliveryErrors, 
      this.allMessages, 
      this.fromActiveLoadsOnly, 
      this.fromLoadConnect,});

  NotificationSettingsRequest.fromJson(dynamic json) {
    offerRecieved = json['offer_recieved'];
    offerAccepted = json['offer_accepted'];
    loadPickedUp = json['load_picked_up'];
    loadDelivered = json['load_delivered'];
    deliveryErrors = json['delivery_errors'];
    allMessages = json['all_messages'];
    fromActiveLoadsOnly = json['from_active_loads_only'];
    fromLoadConnect = json['from_load_connect'];
  }
  num? offerRecieved;
  num? offerAccepted;
  num? loadPickedUp;
  num? loadDelivered;
  num? deliveryErrors;
  num? allMessages;
  num? fromActiveLoadsOnly;
  num? fromLoadConnect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offer_recieved'] = offerRecieved;
    map['offer_accepted'] = offerAccepted;
    map['load_picked_up'] = loadPickedUp;
    map['load_delivered'] = loadDelivered;
    map['delivery_errors'] = deliveryErrors;
    map['all_messages'] = allMessages;
    map['from_active_loads_only'] = fromActiveLoadsOnly;
    map['from_load_connect'] = fromLoadConnect;
    return map;
  }

}