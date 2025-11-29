import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Data/Models/weather_status_response_model.dart';

class WeatherStatusApiService {
  final ApiConsumer apiConsumer;

  WeatherStatusApiService(this.apiConsumer);

  Future<WeatherStatusResponseModel> getWeatherStatus({
    required int farmerId,
  }) async {
    final response = await apiConsumer.get(
      Endpoints.weatherStatusEndPoint(farmerId),
    );
    return WeatherStatusResponseModel.fromJson(response);
  }
}

