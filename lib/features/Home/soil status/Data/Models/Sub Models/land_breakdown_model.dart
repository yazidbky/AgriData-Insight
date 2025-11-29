import 'package:makers_hackathon/features/Home/soil%20status/Data/Models/Sub%20Models/section_model.dart';

class LandBreakdownModel {
  final int landId;
  final int averageHealthScore;
  final String status;
  final int sectionsCount;
  final List<SectionModel> sections;

  LandBreakdownModel({
    required this.landId,
    required this.averageHealthScore,
    required this.status,
    required this.sectionsCount,
    required this.sections,
  });

  factory LandBreakdownModel.fromJson(Map<String, dynamic> json) {
    return LandBreakdownModel(
      landId: json['landId'] ?? 0,
      averageHealthScore: json['averageHealthScore'] ?? 0,
      status: json['status'] ?? '',
      sectionsCount: json['sectionsCount'] ?? 0,
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'landId': landId,
        'averageHealthScore': averageHealthScore,
        'status': status,
        'sectionsCount': sectionsCount,
        'sections': sections.map((e) => e.toJson()).toList(),
      };
}

