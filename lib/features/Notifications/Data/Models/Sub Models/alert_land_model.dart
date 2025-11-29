class AlertLandModel {
  final int id;
  final double lat;
  final double lng;

  AlertLandModel({
    required this.id,
    required this.lat,
    required this.lng,
  });

  factory AlertLandModel.fromJson(Map<String, dynamic> json) {
    return AlertLandModel(
      id: json['id'] ?? 0,
      lat: _parseDouble(json['lat']),
      lng: _parseDouble(json['lng']),
    );
  }

  /// Parses a value that could be a string, int, double, or null to double
  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
      };
}

