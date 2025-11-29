class LatestWeatherModel {
  final String date;
  final double temperature;
  final double rainfall;
  final double humidity;
  final String impact;

  LatestWeatherModel({
    required this.date,
    required this.temperature,
    required this.rainfall,
    required this.humidity,
    required this.impact,
  });

  factory LatestWeatherModel.fromJson(Map<String, dynamic> json) {
    return LatestWeatherModel(
      date: json['date'] ?? '',
      temperature: _parseDouble(json['temperature']),
      rainfall: _parseDouble(json['rainfall']),
      humidity: _parseDouble(json['humidity']),
      impact: json['impact'] ?? '',
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'temperature': temperature,
        'rainfall': rainfall,
        'humidity': humidity,
        'impact': impact,
      };
}

