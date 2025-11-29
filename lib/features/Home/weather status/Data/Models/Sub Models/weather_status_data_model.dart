import 'package:makers_hackathon/features/Home/weather%20status/Data/Models/Sub%20Models/weather_land_breakdown_model.dart';

class WeatherStatusDataModel {
  final int farmerId;
  final String overallWeatherStatus;
  final double overallAverageTemperature;
  final double overallTotalRainfall;
  final double overallAverageHumidity;
  final int totalDaysAnalyzed;
  final int landsCount;
  final List<WeatherLandBreakdownModel> landsBreakdown;

  WeatherStatusDataModel({
    required this.farmerId,
    required this.overallWeatherStatus,
    required this.overallAverageTemperature,
    required this.overallTotalRainfall,
    required this.overallAverageHumidity,
    required this.totalDaysAnalyzed,
    required this.landsCount,
    required this.landsBreakdown,
  });

  factory WeatherStatusDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherStatusDataModel(
      farmerId: json['farmerId'] ?? 0,
      overallWeatherStatus: json['overallWeatherStatus'] ?? '',
      overallAverageTemperature: _parseDouble(json['overallAverageTemperature']),
      overallTotalRainfall: _parseDouble(json['overallTotalRainfall']),
      overallAverageHumidity: _parseDouble(json['overallAverageHumidity']),
      totalDaysAnalyzed: json['totalDaysAnalyzed'] ?? 0,
      landsCount: json['landsCount'] ?? 0,
      landsBreakdown: (json['landsBreakdown'] as List<dynamic>?)
              ?.map((e) => WeatherLandBreakdownModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
        'farmerId': farmerId,
        'overallWeatherStatus': overallWeatherStatus,
        'overallAverageTemperature': overallAverageTemperature,
        'overallTotalRainfall': overallTotalRainfall,
        'overallAverageHumidity': overallAverageHumidity,
        'totalDaysAnalyzed': totalDaysAnalyzed,
        'landsCount': landsCount,
        'landsBreakdown': landsBreakdown.map((e) => e.toJson()).toList(),
      };
}

