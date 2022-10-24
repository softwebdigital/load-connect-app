/// first_name : "me"
/// last_name : "you"
/// email : "menyou1@mailinator.com"
/// phone_number : "08088888881"
/// password : "menyou12345@"
/// user_type : "dispatch"

class CreateAccountRequest {
  CreateAccountRequest({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone,
      this.password, 
      // this.userType,
  });

  CreateAccountRequest.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    // userType = json['user_type'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  // String? userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    // map['user_type'] = userType;
    return map;
  }

}