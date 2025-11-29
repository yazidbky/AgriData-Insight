class RegistrationRequestModel {
  String fullName;
  String email;
  String username;
  String phoneNumber;
  String password;
  String fcmToken;

  RegistrationRequestModel({
    required this.fullName,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
    required this.fcmToken,
  });

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    return RegistrationRequestModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'password': password,
        'fcmToken': fcmToken,
      };
}