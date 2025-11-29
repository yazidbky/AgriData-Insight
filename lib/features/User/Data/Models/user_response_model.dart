import 'package:makers_hackathon/features/User/Data/Models/Sub%20Models/user_data_model.dart';

class UserResponseModel {
  int statusCode;
  UserDataModel data;
  String message;
  bool success;

  UserResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: UserDataModel.fromJson(json['data'] ?? {}),
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

