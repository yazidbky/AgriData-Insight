import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Data/Api/soil_status_api_service.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Logic/soil_status_state.dart';

class SoilStatusCubit extends Cubit<SoilStatusState> {
  final SoilStatusApiService apiService;

  SoilStatusCubit(this.apiService) : super(SoilStatusInitial());

  Future<void> getSoilStatus({required int farmerId}) async {
    emit(SoilStatusLoading());

    try {
      final response = await apiService.getSoilStatus(farmerId: farmerId);

      if (response.statusCode == 200 && response.success == true) {
        emit(SoilStatusSuccess(
          soilStatusData: response.data,
          message: response.message,
        ));
      } else {
        emit(SoilStatusFailure(
          response.message.isNotEmpty ? response.message : ApiErrors.unknownError,
        ));
      }
    } on ServerException catch (e) {
      emit(SoilStatusFailure(e.errorModel.message));
    } catch (e) {
      emit(SoilStatusFailure(ApiErrors.unknownError));
    }
  }

  /// Reset to initial state
  void reset() {
    emit(SoilStatusInitial());
  }
}

