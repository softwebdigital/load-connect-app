/// code : 201
/// message : "These credentials do not match our records."
/// status : false
/// data : null

class ApiResponse {
  ApiResponse({
      // required this.code,
      required this.message,
      required this.status,
      this.data,});

  ApiResponse.fromJson(dynamic json) {
    // code = json['code'];
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }
  // late int code;
  late String message;
  late bool status;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['code'] = code;
    map['message'] = message;
    map['status'] = status;
    map['data'] = data;
    return map;
  }

}