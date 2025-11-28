import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Auth/Login/Data/Models/login_request_model.dart';
import 'package:makers_hackathon/features/Auth/Login/Data/Models/login_response_model.dart';


class LoginApiService {
  final ApiConsumer apiConsumer;

  LoginApiService(this.apiConsumer);

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
   

    final response = await apiConsumer.post(
      Endpoints.loginEndPoint,
      data: loginRequestModel.toJson(),
    );
    return LoginResponseModel.fromJson(response);
  }
}