import 'package:makers_hackathon/features/Auth/Login/Data/Models/Sub%20Models/farmer_model.dart';

class DataModel {
  FarmerData farmerData ;
  String token ; 

  DataModel({
    required this.farmerData,
    required this.token
  });

    factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
     farmerData: FarmerData.fromJson(json['farmerData'] ?? {}),
     token: json['token'] ?? ''
    );
  }

   Map<String, dynamic> toJson() => {
     'farmerData': farmerData, 'token': token
  };

}