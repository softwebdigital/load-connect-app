/// user_id : 2
/// type : "register"

class GenerateTokenRequest {
  GenerateTokenRequest({
      this.userId, 
      this.type,});

  GenerateTokenRequest.fromJson(dynamic json) {
    userId = json['user_id'];
    type = json['type'];
  }
  int? userId;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['type'] = type;
    return map;
  }

}