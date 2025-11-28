class RegistrationRequestModel {
  String fullName ,email  , username , phoneNumber , password;


   RegistrationRequestModel({required this.fullName , required this.email , required this.username , required this.phoneNumber , required this.password });

  factory RegistrationRequestModel.fromJson(Map<String , dynamic > json ){
    return RegistrationRequestModel(
      fullName : json['fullName'],
      email : json['email'],
      username : json['username'],
      phoneNumber : json['phoneNumber'],
      password : json['password'],
    );
  }

  Map<String,dynamic> toJson () => {
    'fullName' : fullName,
     'email' : email,
      'username' : username,
       'phoneNumber' : phoneNumber,
        'password' : password,

  };



}