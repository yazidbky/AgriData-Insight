import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/User/Data/Models/user_response_model.dart';

class UserApiService {
  final ApiConsumer apiConsumer;

  UserApiService(this.apiConsumer);

  Future<UserResponseModel> getUserProfile() async {
    final response = await apiConsumer.get(
      Endpoints.userProfileEndPoint,
    );
    return UserResponseModel.fromJson(response);
  }
}

