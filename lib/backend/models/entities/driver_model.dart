/// id : 3
/// first_name : "Jay"
/// last_name : "Ayo"
/// email : "dawodubabatundecharming@gmail.com"
/// phone_number : "07013117252"
/// email_verified_at : "2022-05-17T00:09:47.000000Z"
/// is_admin : 0
/// is_active : 1
/// firebase_token : "dydhdydjmd===djhd65yrjhdbdd"
/// user_type : "dispatch"
/// current_team_id : null
/// profile_photo_path : "profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG"
/// created_at : "2022-05-17T00:01:28.000000Z"
/// updated_at : "2022-05-17T00:19:56.000000Z"
/// profile_photo_url : "https://app.loadconnect.ng/storage/profile-photos/Lhs3h9kIKhsqSsDQJvceEArRG.JPG"
/// more : {"state":"Lagos","address":"7 lateef fagbemi","nationality":"nigeria","date_of_birth":"1992-04-17","next_kin_name":"Ololade Dawodu","driver_license":"driver-licenses/otzi3LKSNydi8LfijftycyBTC.jpeg","guarantor_name":"Abimbola Oshin","gurantor_address":"7 oshinfolawe Ijebu Ifon","local_government":"Shomolu","next_kin_address":"Fowobi, 10 Ogun state","guarantor_passport":"guarantor-licenses/o5iKy00ITcU0Ck3JSkGdGxeaM.JPG","next_kin_phone_number":"08056575885","next_kin_relationship":"brother","guarantor_phone_number":"09013117251","is_guarantor_confirmed":true}
/// uid : "eyJpdiI6Im9CTkJsYnJIaXpJbi9waVNPSTlsdFE9PSIsInZhbHVlIjoiMmhodVBqdGdSam9Yc2dRRkhlUUxLUT09IiwibWFjIjoiYTcwMjNlNzc0MDk2MWJiMmJjOWE3ZDI4NTM3YmUwMzM5N2RjNmMwYTQ2ZGVlMDkyZTY5MjI5OTA5NjY3ODBiNiIsInRhZyI6IiJ9"
/// full_ratings : 0

class DriverModel {
  DriverModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.emailVerifiedAt, 
      this.isAdmin, 
      this.isActive, 
      this.firebaseToken, 
      this.userType, 
      this.currentTeamId, 
      this.profilePhotoPath, 
      this.createdAt, 
      this.updatedAt, 
      this.profilePhotoUrl, 
      this.more, 
      this.uid, 
      this.fullRatings,});

  DriverModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    isActive = json['is_active'];
    firebaseToken = json['firebase_token'];
    userType = json['user_type'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
    more = json['more'] != null ? More.fromJson(json['more']) : null;
    uid = json['uid'];
    fullRatings = json['full_ratings'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  int? isAdmin;
  int? isActive;
  String? firebaseToken;
  String? userType;
  dynamic currentTeamId;
  String? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;
  More? more;
  String? uid;
  int? fullRatings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['email_verified_at'] = emailVerifiedAt;
    map['is_admin'] = isAdmin;
    map['is_active'] = isActive;
    map['firebase_token'] = firebaseToken;
    map['user_type'] = userType;
    map['current_team_id'] = currentTeamId;
    map['profile_photo_path'] = profilePhotoPath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_photo_url'] = profilePhotoUrl;
    if (more != null) {
      map['more'] = more?.toJson();
    }
    map['uid'] = uid;
    map['full_ratings'] = fullRatings;
    return map;
  }

}

/// state : "Lagos"
/// address : "7 lateef fagbemi"
/// nationality : "nigeria"
/// date_of_birth : "1992-04-17"
/// next_kin_name : "Ololade Dawodu"
/// driver_license : "driver-licenses/otzi3LKSNydi8LfijftycyBTC.jpeg"
/// guarantor_name : "Abimbola Oshin"
/// gurantor_address : "7 oshinfolawe Ijebu Ifon"
/// local_government : "Shomolu"
/// next_kin_address : "Fowobi, 10 Ogun state"
/// guarantor_passport : "guarantor-licenses/o5iKy00ITcU0Ck3JSkGdGxeaM.JPG"
/// next_kin_phone_number : "08056575885"
/// next_kin_relationship : "brother"
/// guarantor_phone_number : "09013117251"
/// is_guarantor_confirmed : true

class More {
  More({
      this.state, 
      this.address, 
      this.nationality, 
      this.dateOfBirth, 
      this.nextKinName, 
      this.driverLicense, 
      this.guarantorName, 
      this.gurantorAddress, 
      this.localGovernment, 
      this.nextKinAddress, 
      this.guarantorPassport, 
      this.nextKinPhoneNumber, 
      this.nextKinRelationship, 
      this.guarantorPhoneNumber, 
      this.isGuarantorConfirmed,});

  More.fromJson(dynamic json) {
    state = json['state'];
    address = json['address'];
    nationality = json['nationality'];
    dateOfBirth = json['date_of_birth'];
    nextKinName = json['next_kin_name'];
    driverLicense = json['driver_license'];
    guarantorName = json['guarantor_name'];
    gurantorAddress = json['gurantor_address'];
    localGovernment = json['local_government'];
    nextKinAddress = json['next_kin_address'];
    guarantorPassport = json['guarantor_passport'];
    nextKinPhoneNumber = json['next_kin_phone_number'];
    nextKinRelationship = json['next_kin_relationship'];
    guarantorPhoneNumber = json['guarantor_phone_number'];
    isGuarantorConfirmed = json['is_guarantor_confirmed'];
  }
  String? state;
  String? address;
  String? nationality;
  String? dateOfBirth;
  String? nextKinName;
  String? driverLicense;
  String? guarantorName;
  String? gurantorAddress;
  String? localGovernment;
  String? nextKinAddress;
  String? guarantorPassport;
  String? nextKinPhoneNumber;
  String? nextKinRelationship;
  String? guarantorPhoneNumber;
  bool? isGuarantorConfirmed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    map['address'] = address;
    map['nationality'] = nationality;
    map['date_of_birth'] = dateOfBirth;
    map['next_kin_name'] = nextKinName;
    map['driver_license'] = driverLicense;
    map['guarantor_name'] = guarantorName;
    map['gurantor_address'] = gurantorAddress;
    map['local_government'] = localGovernment;
    map['next_kin_address'] = nextKinAddress;
    map['guarantor_passport'] = guarantorPassport;
    map['next_kin_phone_number'] = nextKinPhoneNumber;
    map['next_kin_relationship'] = nextKinRelationship;
    map['guarantor_phone_number'] = guarantorPhoneNumber;
    map['is_guarantor_confirmed'] = isGuarantorConfirmed;
    return map;
  }

}