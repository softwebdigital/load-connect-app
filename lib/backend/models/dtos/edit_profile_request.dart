/// first_name : "Babatunde"
/// last_name : "Dawodu"
/// state : "Lagos"
/// address : "248 Borno way, Yaba Lagos"

class EditProfileRequest {
  EditProfileRequest({
      this.firstName, 
      this.email,
      this.phone,
      this.lastName,
      this.state, 
      this.address,});

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['first_name'];
    phone = json['phone'];
    email = json['email'];
    lastName = json['last_name'];
    state = json['state'];
    address = json['address'];
  }
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? state;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['state_of_residence'] = state;
    map['residential_address'] = address;
    return map;
  }

}