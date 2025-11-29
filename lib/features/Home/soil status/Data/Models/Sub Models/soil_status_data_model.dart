import 'package:makers_hackathon/features/Home/soil%20status/Data/Models/Sub%20Models/land_breakdown_model.dart';

class SoilStatusDataModel {
  final int farmerId;
  final int overallHealthScore;
  final String overallStatus;
  final int totalSections;
  final int landsCount;
  final List<LandBreakdownModel> landsBreakdown;

  SoilStatusDataModel({
    required this.farmerId,
    required this.overallHealthScore,
    required this.overallStatus,
    required this.totalSections,
    required this.landsCount,
    required this.landsBreakdown,
  });

  factory SoilStatusDataModel.fromJson(Map<String, dynamic> json) {
    return SoilStatusDataModel(
      farmerId: json['farmerId'] ?? 0,
      overallHealthScore: json['overallHealthScore'] ?? 0,
      overallStatus: json['overallStatus'] ?? '',
      totalSections: json['totalSections'] ?? 0,
      landsCount: json['landsCount'] ?? 0,
      landsBreakdown: (json['landsBreakdown'] as List<dynamic>?)
              ?.map((e) => LandBreakdownModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'farmerId': farmerId,
        'overallHealthScore': overallHealthScore,
        'overallStatus': overallStatus,
        'totalSections': totalSections,
        'landsCount': landsCount,
        'landsBreakdown': landsBreakdown.map((e) => e.toJson()).toList(),
      };
}

