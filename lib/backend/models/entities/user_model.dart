/// id : "53eae027-61d7-4782-b535-0f71947f5639"
/// first_name : "Miracle"
/// last_name : "Gabriel"
/// email : "sixpathdev@gmail.com"
/// phone : "08141894420"
/// profile_photo : null
/// otp : "936625"
/// account_verified : 0
/// account_deactivated : 0
/// account_type : null
/// business_name : null
/// cac_number : null
/// business_email : null
/// email_verified_at : null
/// created_at : "2022-09-27T12:51:54.000000Z"
/// updated_at : "2022-09-27T15:36:52.000000Z"

class UserModel {
  UserModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.profilePhoto, 
      this.otp, 
      this.accountVerified, 
      this.accountDeactivated, 
      this.accountType, 
      this.businessName, 
      this.cacNumber, 
      this.businessEmail, 
      this.stateOfResidence,
      this.residentialAddress,
      this.emailVerifiedAt,
      this.createdAt, 
      this.updatedAt,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    profilePhoto = json['profile_photo'];
    otp = json['otp'];
    accountVerified = json['account_verified'] != 0;
    accountDeactivated = json['account_deactivated'] != 0;
    accountType = json['account_type'];
    businessName = json['business_name'];
    cacNumber = json['cac_number'];
    businessEmail = json['business_email'];
    stateOfResidence = json['state_of_residence'];
    residentialAddress = json['residential_address'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic profilePhoto;
  dynamic otp;
  bool? accountVerified;
  bool? accountDeactivated;
  dynamic accountType;
  dynamic businessName;
  dynamic cacNumber;
  dynamic businessEmail;
  dynamic residentialAddress;
  dynamic stateOfResidence;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['profile_photo'] = profilePhoto;
    map['otp'] = otp;
    map['account_verified'] = accountVerified;
    map['account_deactivated'] = accountDeactivated;
    map['account_type'] = accountType;
    map['business_name'] = businessName;
    map['cac_number'] = cacNumber;
    map['business_email'] = businessEmail;
    map['state_of_residence'] = stateOfResidence;
    map['residential_address'] = residentialAddress;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}