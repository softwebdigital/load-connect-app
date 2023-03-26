/// location : "Port Harcourt"
/// radius : 10
/// date_of_availability : "2022-08-13 12:52:17"
/// capacity : "full-truck-load"

class GoLiveRequest {
  GoLiveRequest({
      this.location, 
      this.radius, 
      this.dateOfAvailability, 
      this.capacity,});

  GoLiveRequest.fromJson(dynamic json) {
    location = json['location'];
    radius = json['radius'];
    dateOfAvailability = json['date_of_availability'];
    capacity = json['capacity'];
  }
  String? location;
  num? radius;
  String? dateOfAvailability;
  String? capacity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location'] = location;
    map['radius'] = radius;
    map['date_of_availability'] = dateOfAvailability;
    map['capacity'] = capacity;
    return map;
  }

}