import 'package:makers_hackathon/features/Notifications/Data/Models/Sub%20Models/alerts_data_model.dart';

class AlertsResponseModel {
  final int statusCode;
  final AlertsDataModel data;
  final String message;
  final bool success;

  AlertsResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory AlertsResponseModel.fromJson(Map<String, dynamic> json) {
    return AlertsResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: AlertsDataModel.fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'data': data.toJson(),
        'message': message,
        'success': success,
      };
}

