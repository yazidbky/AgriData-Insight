import 'package:makers_hackathon/features/Home/weather%20status/Data/Models/Sub%20Models/latest_weather_model.dart';

class WeatherLandBreakdownModel {
  final int landId;
  final String location;
  final double averageTemperature;
  final double totalRainfall;
  final double averageHumidity;
  final String weatherStatus;
  final int extremeWeatherDays;
  final int totalDays;
  final LatestWeatherModel latestWeather;

  WeatherLandBreakdownModel({
    required this.landId,
    required this.location,
    required this.averageTemperature,
    required this.totalRainfall,
    required this.averageHumidity,
    required this.weatherStatus,
    required this.extremeWeatherDays,
    required this.totalDays,
    required this.latestWeather,
  });

  factory WeatherLandBreakdownModel.fromJson(Map<String, dynamic> json) {
    return WeatherLandBreakdownModel(
      landId: json['landId'] ?? 0,
      location: json['location'] ?? '',
      averageTemperature: _parseDouble(json['averageTemperature']),
      totalRainfall: _parseDouble(json['totalRainfall']),
      averageHumidity: _parseDouble(json['averageHumidity']),
      weatherStatus: json['weatherStatus'] ?? '',
      extremeWeatherDays: json['extremeWeatherDays'] ?? 0,
      totalDays: json['totalDays'] ?? 0,
      latestWeather: LatestWeatherModel.fromJson(json['latestWeather'] ?? {}),
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
        'landId': landId,
        'location': location,
        'averageTemperature': averageTemperature,
        'totalRainfall': totalRainfall,
        'averageHumidity': averageHumidity,
        'weatherStatus': weatherStatus,
        'extremeWeatherDays': extremeWeatherDays,
        'totalDays': totalDays,
        'latestWeather': latestWeather.toJson(),
      };
}

