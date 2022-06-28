/// user_id : 2
/// token : "249612"

class VerifyTokenRequest {
  VerifyTokenRequest({
      this.userId, 
      this.token,});

  VerifyTokenRequest.fromJson(dynamic json) {
    userId = json['user_id'];
    token = json['token'];
  }
  int? userId;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['token'] = token;
    return map;
  }

}