import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart';
import 'package:makers_hackathon/features/auth/Login/Data/Api/login_api_service.dart';
import 'package:makers_hackathon/features/auth/Login/Data/Models/login_request_model.dart';
import 'package:makers_hackathon/features/auth/Login/Logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginApiService apiService ;
  LoginCubit(this.apiService) : super(LoginInitial());


  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());

    try {
      final response = await apiService.login(loginRequestModel);

      if (response.statusCode == 200 && response.success == 'true') {
        // TODO: Store token securely using flutter_secure_storage
        // await secureStorage.write(key: 'auth_token', value: response.dataModel.token);
        // TODO: Store user data if needed
        emit(LoginSuccess(response.message));
      } else if (response.statusCode == 401) {
        emit(LoginFailure(response.message));
      } else if (response.statusCode == 500) {
        emit(LoginFailure(response.message));
      } else {
        emit(LoginFailure(response.message.isNotEmpty ? response.message : ApiErrors.unknownError));
      }
    } catch (e) {
      emit(LoginFailure(ApiErrors.unknownError));
    }
  }
}