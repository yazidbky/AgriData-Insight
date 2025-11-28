class RegistrationResponseModel {
  String data ;

   RegistrationResponseModel({required this.data});

  factory RegistrationResponseModel.fromJson(Map<String , dynamic > json ){
    return RegistrationResponseModel(
      data : json['data']
    );
  }

  Map<String,dynamic> toJson () => {
    'data' : data 
  };
}