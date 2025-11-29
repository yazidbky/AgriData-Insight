import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/Notifications/Data/Api/alerts_api_service.dart';
import 'package:makers_hackathon/features/Notifications/Logic/alerts_state.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final AlertsApiService apiService;

  AlertsCubit(this.apiService) : super(AlertsInitial());

  Future<void> getAlerts({int? limit, int? offset}) async {
    emit(AlertsLoading());

    try {
      final response = await apiService.getAlerts(
        limit: limit,
        offset: offset,
      );

      if (response.statusCode == 200 && response.success == true) {
        emit(AlertsSuccess(
          alertsData: response.data,
          message: response.message,
        ));
      } else {
        emit(AlertsFailure(
          response.message.isNotEmpty ? response.message : ApiErrors.unknownError,
        ));
      }
    } on ServerException catch (e) {
      emit(AlertsFailure(e.errorModel.message));
    } catch (e) {
      emit(AlertsFailure(ApiErrors.unknownError));
    }
  }

  /// Reset to initial state
  void reset() {
    emit(AlertsInitial());
  }
}

