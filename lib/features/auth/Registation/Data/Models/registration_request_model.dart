class RegistrationRequestModel {
  String data ;

   RegistrationRequestModel({required this.data});

  factory RegistrationRequestModel.fromJson(Map<String , dynamic > json ){
    return RegistrationRequestModel(
      data : json['data']
    );
  }

  Map<String,dynamic> toJson () => {
    'data' : data 
  };



}