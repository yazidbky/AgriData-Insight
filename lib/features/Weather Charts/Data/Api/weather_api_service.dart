import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Data/Models/weather_request_model.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Data/Models/weather_response_model.dart';

class WeatherApiService {
  final ApiConsumer apiConsumer;

  WeatherApiService(this.apiConsumer);

  Future<WeatherResponseModel> fetchAndSaveWeather(WeatherRequestModel request) async {
    final response = await apiConsumer.post(
      Endpoints.weatherFetchAndSaveEndPoint,
      data: request.toJson(),
    );
    return WeatherResponseModel.fromJson(response);
  }
}

