import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Data/Api/weather_status_api_service.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Logic/weather_status_state.dart';

class WeatherStatusCubit extends Cubit<WeatherStatusState> {
  final WeatherStatusApiService apiService;

  WeatherStatusCubit(this.apiService) : super(WeatherStatusInitial());

  Future<void> getWeatherStatus({required int farmerId}) async {
    emit(WeatherStatusLoading());

    try {
      final response = await apiService.getWeatherStatus(farmerId: farmerId);

      if (response.statusCode == 200 && response.success == true) {
        emit(WeatherStatusSuccess(
          weatherStatusData: response.data,
          message: response.message,
        ));
      } else {
        emit(WeatherStatusFailure(
          response.message.isNotEmpty ? response.message : ApiErrors.unknownError,
        ));
      }
    } on ServerException catch (e) {
      emit(WeatherStatusFailure(e.errorModel.message));
    } catch (e) {
      emit(WeatherStatusFailure(ApiErrors.unknownError));
    }
  }

  /// Reset to initial state
  void reset() {
    emit(WeatherStatusInitial());
  }
}

