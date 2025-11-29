import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Data/Api/weather_api_service.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Data/Models/weather_request_model.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Logic/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApiService apiService;

  WeatherCubit(this.apiService) : super(WeatherInitial());

  Future<void> fetchAndSaveWeather(int landId) async {
    emit(WeatherLoading());

    try {
      final request = WeatherRequestModel(landId: landId);
      final response = await apiService.fetchAndSaveWeather(request);

      if (response.statusCode == 200 && response.success == true) {
        emit(WeatherSuccess(
          weatherData: response.data,
          message: response.message,
        ));
      } else if (response.statusCode == 400) {
        // Validation error
        emit(WeatherFailure(response.message));
      } else if (response.statusCode == 404) {
        // Land not found
        emit(WeatherFailure(response.message));
      } else {
        emit(WeatherFailure(
          response.message.isNotEmpty ? response.message : ApiErrors.unknownError,
        ));
      }
    } on ServerException catch (e) {
      emit(WeatherFailure(e.errorModel.message));
    } catch (e) {
      emit(WeatherFailure(ApiErrors.unknownError));
    }
  }

  /// Reset to initial state
  void reset() {
    emit(WeatherInitial());
  }
}

