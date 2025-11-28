import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Models/registration_request_model.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Models/registration_response_model.dart';

class RegistationApiService {
  final ApiConsumer apiConsumer ;

  const RegistationApiService(this.apiConsumer);

  Future<RegistrationResponseModel> register (RegistrationRequestModel registrationRequestModel)async {
    final response = await apiConsumer.post(
      Endpoints.registerEndPoint,
      data : registrationRequestModel.toJson(),
    );

    return RegistrationResponseModel.fromJson(response);

  }

}