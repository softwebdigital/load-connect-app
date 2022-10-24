/// id : 3
/// user_id : 4
/// amount : 0
/// created_at : "2022-06-23T14:54:39.000000Z"
/// updated_at : "2022-06-23T14:54:39.000000Z"

class WalletModel {
  WalletModel({
      this.id, 
      this.userId, 
      this.amount, 
      this.createdAt, 
      this.updatedAt,});

  WalletModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? amount;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['amount'] = amount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}