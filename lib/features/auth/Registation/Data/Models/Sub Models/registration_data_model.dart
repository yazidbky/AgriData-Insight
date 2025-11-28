import 'package:makers_hackathon/features/auth/Registation/Data/Models/Sub%20Models/farmer_model.dart';

class RegistrationDataModel {
  FarmerModel farmer;
  String token;

  RegistrationDataModel({
    required this.farmer,
    required this.token,
  });

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) {
    return RegistrationDataModel(
      farmer: FarmerModel.fromJson(json['farmer'] ?? {}),
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'farmer': farmer.toJson(),
        'token': token,
      };
}