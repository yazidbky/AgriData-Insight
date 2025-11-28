import 'package:makers_hackathon/features/Auth/Registation/Data/Models/Sub%20Models/registration_data_model.dart';

class RegistrationResponseModel {
  int statusCode;
  RegistrationDataModel data;
  String message;
  bool success;

  RegistrationResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return RegistrationResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: RegistrationDataModel.fromJson(json['data'] ?? {}),
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



