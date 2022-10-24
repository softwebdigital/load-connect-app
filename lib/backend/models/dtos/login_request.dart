/// email : "07013117251"
/// password : "D1234567000@1"
/// firebase_token : "dydhdydjmd===djhd65yrjhdbdd"

class LoginRequest {
  LoginRequest({
      this.email, 
      this.password, 
      this.firebaseToken,});

  LoginRequest.fromJson(dynamic json) {
    email = json['login'];
    password = json['password'];
    firebaseToken = json['firebase_token'];
  }
  String? email;
  String? password;
  String? firebaseToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = email;
    map['password'] = password;
    map['firebase_token'] = firebaseToken;
    return map;
  }

}