import 'package:load_connect_driver/backend/models/entities/user_model.dart';

/// token : "1|iypAmpj0ai4actrEMzP6G3fI5aeZ3wVUjAQK7mQJ"
/// user : {"id":2,"first_name":"Babatunde","last_name":"Dawodu","email":"dawodubabatundehaywhy@gmail.com","phone_number":"07013117251","email_verified_at":"2022-05-16T23:25:46.000000Z","is_admin":0,"is_active":1,"firebase_token":"dydhdydjmd===djhd65yrjhdbdd","user_type":"user","current_team_id":null,"profile_photo_path":null,"created_at":"2022-05-16T22:58:33.000000Z","updated_at":"2022-05-16T23:25:46.000000Z","profile_photo_url":"https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF","more":null,"uid":"eyJpdiI6IjJGblFyd25OcVRJSHJSRzRIckI2VEE9PSIsInZhbHVlIjoiVndnaFJHSXprdEl5eEZYN01EcWtSdz09IiwibWFjIjoiZjdmOWQ4ODUwZGNmMzQ4NzIyMWQ5NDg4NzgwYjAzYmI3ODg5NThhMDY1MmZmNjJlZjNjODg0MjY1ZWU1NjcxMyIsInRhZyI6IiJ9","full_ratings":0}

class LoginResponse {
  LoginResponse({
      this.token, 
      this.isDriverConfirmed,
      this.user,});

  LoginResponse.fromJson(dynamic json) {
    print("ToJson ::: $json");
    token = json['token'];
    isDriverConfirmed = json['is_driver_confirmed'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? token;
  bool? isDriverConfirmed;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['is_driver_confirmed'] = isDriverConfirmed;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}
