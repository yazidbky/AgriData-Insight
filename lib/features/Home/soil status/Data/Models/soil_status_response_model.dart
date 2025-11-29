import 'package:makers_hackathon/features/Home/soil%20status/Data/Models/Sub%20Models/soil_status_data_model.dart';

class SoilStatusResponseModel {
  final int statusCode;
  final SoilStatusDataModel data;
  final String message;
  final bool success;

  SoilStatusResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory SoilStatusResponseModel.fromJson(Map<String, dynamic> json) {
    return SoilStatusResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: SoilStatusDataModel.fromJson(json['data'] ?? {}),
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

