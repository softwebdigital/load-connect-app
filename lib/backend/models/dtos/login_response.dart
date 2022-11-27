import 'package:load_connect/backend/models/entities/user_model.dart';

/// token : "4|6NTgE4SOVSGQu4J4YNZzLebZNLtR3xkDrm9YZV6E"
/// user : {"id":"05646305-1d35-4985-bb14-58799fae0d69","first_name":"Miracle","last_name":"Gabriel","email":"sixpathdev@gmail.com","phone":"08141894420","profile_photo":null,"state_of_residence":null,"residential_address":null,"otp":null,"account_verified":1,"account_deactivated":0,"account_type":"user","business_name":null,"cac_number":null,"business_email":null,"business_address":null,"email_verified_at":null,"created_at":"2022-11-08T13:12:34.000000Z","updated_at":"2022-11-08T13:12:48.000000Z"}
/// is_driver_confirmed : false

class LoginResponse {
  LoginResponse({
      this.token, 
      this.user, 
      this.isDriverConfirmed,});

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    isDriverConfirmed = json['is_driver_confirmed'];
  }
  String? token;
  UserModel? user;
  bool? isDriverConfirmed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['is_driver_confirmed'] = isDriverConfirmed;
    return map;
  }

}
