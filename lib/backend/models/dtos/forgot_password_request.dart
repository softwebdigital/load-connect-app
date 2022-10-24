/// email : "dawodubabatundehaywhy@gmail.com"

class ForgotPasswordRequest {
  ForgotPasswordRequest({
      this.email,});

  ForgotPasswordRequest.fromJson(dynamic json) {
    email = json['login'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = email;
    return map;
  }

}