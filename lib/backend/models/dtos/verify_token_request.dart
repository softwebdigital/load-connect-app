/// email : 2
/// otp : "249612"

class VerifyTokenRequest {
  VerifyTokenRequest({
      this.email,
      this.otp,});

  VerifyTokenRequest.fromJson(dynamic json) {
    email = json['email'];
    otp = json['otp'];
  }
  String? email;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['otp'] = otp;
    return map;
  }

}