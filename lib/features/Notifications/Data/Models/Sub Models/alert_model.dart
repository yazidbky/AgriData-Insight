import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/features/Notifications/Data/Models/Sub%20Models/alert_land_model.dart';

class AlertModel {
  final int id;
  final int farmerId;
  final int landId;
  final String section;
  final String alertType;
  final String title;
  final String description;
  final String icon;
  final String color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AlertLandModel land;

  AlertModel({
    required this.id,
    required this.farmerId,
    required this.landId,
    required this.section,
    required this.alertType,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    required this.land,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json['id'] ?? 0,
      farmerId: json['farmerId'] ?? 0,
      landId: json['landId'] ?? 0,
      section: json['section'] ?? '',
      alertType: json['alertType'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      land: AlertLandModel.fromJson(json['land'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'farmerId': farmerId,
        'landId': landId,
        'section': section,
        'alertType': alertType,
        'title': title,
        'description': description,
        'icon': icon,
        'color': color,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'land': land.toJson(),
      };

  /// Maps the icon string from API to the corresponding asset path
  String get iconAsset {
    switch (icon.toLowerCase()) {
      case 'irrigation':
        return AppAssets.irrigationAlert;
      case 'temperature':
        return AppAssets.temperatureAlert;
      case 'rainfall':
        return AppAssets.rainfallAlert;
      case 'wind':
        return AppAssets.windyWeatherAlert;
      default:
        return AppAssets.irrigationAlert;
    }
  }
}

