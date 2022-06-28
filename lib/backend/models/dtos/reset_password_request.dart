/// token : "198412"
/// user_id : 2
/// password : "D1234567000@1"

class ResetPasswordRequest {
  ResetPasswordRequest({
      this.token, 
      this.userId, 
      this.password,});

  ResetPasswordRequest.fromJson(dynamic json) {
    token = json['token'];
    userId = json['user_id'];
    password = json['password'];
  }
  String? token;
  int? userId;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_id'] = userId;
    map['password'] = password;
    return map;
  }

}