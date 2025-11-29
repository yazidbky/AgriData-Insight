import 'package:makers_hackathon/features/Home/weather%20status/Data/Models/Sub%20Models/weather_status_data_model.dart';

class WeatherStatusResponseModel {
  final int statusCode;
  final WeatherStatusDataModel data;
  final String message;
  final bool success;

  WeatherStatusResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory WeatherStatusResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherStatusResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: WeatherStatusDataModel.fromJson(json['data'] ?? {}),
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

