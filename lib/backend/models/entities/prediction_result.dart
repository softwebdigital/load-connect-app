class PredictionResult {
  final String placeId;
  final String mainAddr;
  final String secondaryAddr;
  final String description;

  PredictionResult.fromMap(Map<String, dynamic> data)
      : placeId = data['place_id'],
        description = data['description'],
        mainAddr = data['structured_formatting']['main_text'],
        secondaryAddr = data['structured_formatting']['secondary_text'];
}