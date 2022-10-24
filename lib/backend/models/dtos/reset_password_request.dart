/// token : "198412"
/// user_id : 2
/// password : "D1234567000@1"

class ResetPasswordRequest {
  ResetPasswordRequest({
      this.password,
      this.confirmPassword,});

  ResetPasswordRequest.fromJson(dynamic json) {
    password = json['password'];
    confirmPassword = json['password_confirmation'];
  }

  String? password;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password_confirmation'] = confirmPassword;
    map['password'] = password;
    return map;
  }

}