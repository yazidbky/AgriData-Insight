class LoginResponseModel {

    String username , password ;

  
  LoginResponseModel({
    required this.username,
    required this.password ,
  });

   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
     username: json['username'],
     password: json['password']
    );
  }

   Map<String, dynamic> toJson() => {
     'username': username, 'password': password
  };
  
}