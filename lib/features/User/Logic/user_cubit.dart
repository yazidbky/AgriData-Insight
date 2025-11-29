import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/User/Data/Api/user_api_service.dart';
import 'package:makers_hackathon/features/User/Logic/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserApiService apiService;

  UserCubit(this.apiService) : super(UserInitial());

  Future<void> getUserProfile() async {
    emit(UserLoading());

    try {
      final response = await apiService.getUserProfile();

      if (response.statusCode == 200 && response.success == true) {
        emit(UserSuccess(
          userData: response.data,
          message: response.message,
        ));
      } else if (response.statusCode == 401) {
        emit(UserFailure(response.message));
      } else if (response.statusCode == 500) {
        emit(UserFailure(response.message));
      } else {
        emit(UserFailure(
            response.message.isNotEmpty ? response.message : ApiErrors.unknownError));
      }
    } on ServerException catch (e) {
      emit(UserFailure(e.errorModel.message));
    } catch (e) {
      emit(UserFailure(ApiErrors.unknownError));
    }
  }
}

