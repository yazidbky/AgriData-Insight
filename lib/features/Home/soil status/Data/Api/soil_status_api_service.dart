import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Data/Models/soil_status_response_model.dart';

class SoilStatusApiService {
  final ApiConsumer apiConsumer;

  SoilStatusApiService(this.apiConsumer);

  Future<SoilStatusResponseModel> getSoilStatus({
    required int farmerId,
  }) async {
    final response = await apiConsumer.get(
      Endpoints.soilStatusEndPoint(farmerId),
    );
    return SoilStatusResponseModel.fromJson(response);
  }
}

