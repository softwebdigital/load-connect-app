/// id : "545202ac-f665-4846-ad37-ba4471e471cb"
/// user_id : "cebbc733-9310-4936-b18e-2c51a0e41860"
/// reason : null
/// created_at : "2022-10-21T17:58:16.000000Z"
/// updated_at : "2022-10-21T17:58:16.000000Z"
/// blockeduser : {"id":"17fe6570-88e0-4a29-8f5c-7e2880ea6c61","first_name":"John","last_name":"Doe","email":"jdoe@gmail.com","phone":"08141894421","profile_photo":null,"otp":"953654","account_verified":0,"account_deactivated":0,"account_type":null,"business_name":null,"cac_number":null,"business_email":null,"business_address":null,"email_verified_at":null,"created_at":"2022-10-21T17:49:07.000000Z","updated_at":"2022-10-21T17:49:07.000000Z","state_of_residence":null,"residential_address":null}

class BlockedUserModel {
  BlockedUserModel({
      this.id, 
      this.userId, 
      this.reason, 
      this.createdAt, 
      this.updatedAt, 
      this.blockeduser,});

  BlockedUserModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    blockeduser = json['blockeduser'] != null ? Blockeduser.fromJson(json['blockeduser']) : null;
  }
  String? id;
  String? userId;
  dynamic reason;
  String? createdAt;
  String? updatedAt;
  Blockeduser? blockeduser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['reason'] = reason;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (blockeduser != null) {
      map['blockeduser'] = blockeduser?.toJson();
    }
    return map;
  }

}

/// id : "17fe6570-88e0-4a29-8f5c-7e2880ea6c61"
/// first_name : "John"
/// last_name : "Doe"
/// email : "jdoe@gmail.com"
/// phone : "08141894421"
/// profile_photo : null
/// otp : "953654"
/// account_verified : 0
/// account_deactivated : 0
/// account_type : null
/// business_name : null
/// cac_number : null
/// business_email : null
/// business_address : null
/// email_verified_at : null
/// created_at : "2022-10-21T17:49:07.000000Z"
/// updated_at : "2022-10-21T17:49:07.000000Z"
/// state_of_residence : null
/// residential_address : null

class Blockeduser {
  Blockeduser({
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
      this.businessAddress, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.stateOfResidence, 
      this.residentialAddress,});

  Blockeduser.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    profilePhoto = json['profile_photo'];
    otp = json['otp'];
    accountVerified = json['account_verified'];
    accountDeactivated = json['account_deactivated'];
    accountType = json['account_type'];
    businessName = json['business_name'];
    cacNumber = json['cac_number'];
    businessEmail = json['business_email'];
    businessAddress = json['business_address'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stateOfResidence = json['state_of_residence'];
    residentialAddress = json['residential_address'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic profilePhoto;
  String? otp;
  num? accountVerified;
  num? accountDeactivated;
  dynamic accountType;
  dynamic businessName;
  dynamic cacNumber;
  dynamic businessEmail;
  dynamic businessAddress;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  dynamic stateOfResidence;
  dynamic residentialAddress;

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
    map['business_address'] = businessAddress;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['state_of_residence'] = stateOfResidence;
    map['residential_address'] = residentialAddress;
    return map;
  }

}