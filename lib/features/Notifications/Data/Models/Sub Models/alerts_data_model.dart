import 'package:makers_hackathon/features/Notifications/Data/Models/Sub%20Models/alert_model.dart';

class AlertsDataModel {
  final List<AlertModel> alerts;
  final int total;
  final int limit;
  final int offset;
  final bool hasMore;

  AlertsDataModel({
    required this.alerts,
    required this.total,
    required this.limit,
    required this.offset,
    required this.hasMore,
  });

  factory AlertsDataModel.fromJson(Map<String, dynamic> json) {
    return AlertsDataModel(
      alerts: (json['alerts'] as List<dynamic>?)
              ?.map((e) => AlertModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] ?? 0,
      limit: json['limit'] ?? 50,
      offset: json['offset'] ?? 0,
      hasMore: json['hasMore'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'alerts': alerts.map((e) => e.toJson()).toList(),
        'total': total,
        'limit': limit,
        'offset': offset,
        'hasMore': hasMore,
      };
}

