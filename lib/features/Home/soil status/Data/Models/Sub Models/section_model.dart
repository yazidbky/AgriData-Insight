class SectionModel {
  final String section;
  final int healthScore;
  final String status;

  SectionModel({
    required this.section,
    required this.healthScore,
    required this.status,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      section: json['section'] ?? '',
      healthScore: json['healthScore'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'section': section,
        'healthScore': healthScore,
        'status': status,
      };
}

