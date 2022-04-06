class User {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? userType;
  final String? photoUrl;
  final String? state;
  final String? address;
  final int? ratings;
  final String? joinedOn;

  String get fullName => "${firstName ?? ''} ${lastName ?? ''} ";

  @override
  String toString() {
    return "User [name=$firstName $lastName,id=$userId,email=$email]";
  }

  User.fromMap(Map<String, dynamic> data)
      : userId = data['id'],
        firstName = data['first_name'],
        lastName = data['last_name'],
        email = data['email'],
        phone = data['phone_number'],
        userType = data['user_type'],
        photoUrl = data['profile_photo_url'],
        state = _getMoreDetails(data['more'], "state"),
        address = _getMoreDetails(data['more'], "address"),
        ratings = data['full_ratings'],
        joinedOn = data['created_at'];

  User.empty()
      : userId = null,
        firstName = null,
        lastName = null,
        email = null,
        phone = null,
        userType = null,
        photoUrl = null,
        state = null,
        address = null,
        ratings = null,
        joinedOn = null;

  static String? _getMoreDetails(dynamic data, String key) {
    if (data is Map && data.containsKey(key)) {
      return data[key];
    }
    return null;
  }

//  "id": 4,
//         "first_name": "Toby",
//         "last_name": "Geeky",
//         "email": "hello@gmail.com",
//         "phone_number": "07013117252",
//         "email_verified_at": null,
//         "is_admin": 0,
//         "is_active": 1,
//         "firebase_token": "dydhdydjmd===djhd65yrjhdbdd",
//         "user_type": "user",
//         "current_team_id": null,
//         "profile_photo_path": null,
//         "created_at": "2022-03-09T01:26:42.000000Z",
//         "updated_at": "2022-03-09T01:32:34.000000Z",
//         "profile_photo_url": "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF",
//         "more": null,
//         "uid": "eyJpdiI6IlVGZnRjWk4xZHRwekkwZ2Nzd2RIQUE9PSIsInZhbHVlIjoib0RhdVcyMTJQcjRYRHN0Zm13UU5TQT09IiwibWFjIjoiMGNiMGU2Y2MzNTZlZjFjMmU2MTE3OGRkMjBlYmM0YjBiZGQ3N2M2NjhiZDk3MDBjYTAyMTdmNDNhMjY1YmNhOSIsInRhZyI6IiJ9",
//         "full_ratings": 0

}
