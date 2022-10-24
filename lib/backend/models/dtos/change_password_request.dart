/// current_password : "D1234567000@1@1"
/// new_password : "D1234567000@1"
/// new_confirm_password : "D1234567000@1"

class ChangePasswordRequest {
  ChangePasswordRequest({
      this.currentPassword, 
      this.newPassword, 
      this.newConfirmPassword,});

  ChangePasswordRequest.fromJson(dynamic json) {
    currentPassword = json['current_password'];
    newPassword = json['password'];
    newConfirmPassword = json['password_confirmation'];
  }
  String? currentPassword;
  String? newPassword;
  String? newConfirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_password'] = currentPassword;
    map['password'] = newPassword;
    map['password_confirmation'] = newConfirmPassword;
    return map;
  }

}