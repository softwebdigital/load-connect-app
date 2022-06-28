/// first_name : "Babatunde"
/// last_name : "Dawodu"
/// state : "Lagos"
/// address : "248 Borno way, Yaba Lagos"

class EditProfileRequest {
  EditProfileRequest({
      this.firstName, 
      this.lastName, 
      this.state, 
      this.address,});

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    state = json['state'];
    address = json['address'];
  }
  String? firstName;
  String? lastName;
  String? state;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['state'] = state;
    map['address'] = address;
    return map;
  }

}