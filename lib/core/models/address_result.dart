class AddressResult {
  final String placeId;
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  AddressResult({
    this.name = "",
    this.address = "",
    this.placeId = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  AddressResult.fromMap(Map<String, dynamic> data)
      : placeId = data['place_id'],
        name = data['name'],
        address = data['formatted_address'],
        latitude = _convertDouble(data['geometry']['location']['lat']),
        longitude = _convertDouble(data['geometry']['location']['lng']);

  static double _convertDouble(dynamic data) {
    if (data is double) {
      return data;
    }
    return double.tryParse(data) ?? 0;
  }
}
