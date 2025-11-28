import 'package:makers_hackathon/features/auth/Login/Data/Models/Sub%20Models/data_model.dart';

class LoginResponseModel {

    int statusCode ;
    DataModel dataModel ;
    String message , success ;

  
  LoginResponseModel({
    required this.statusCode,
    required this.dataModel ,
    required this.message , 
    required this.success
  });

   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
     statusCode: json['statusCode'] ?? 0,
     dataModel: DataModel.fromJson(json['data'] ?? {}),
     message: json['message'] ?? '',
     success: json['success'] ?? '',
    );
  }

   Map<String, dynamic> toJson() => {
     'statusCode': statusCode, 'dataModel': dataModel,'message': message, 'success': success,
  };
  
}







