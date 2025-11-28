import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart' show ApiErrors;
import 'package:makers_hackathon/features/auth/Registation/Data/Api/registation_api_service.dart';
import 'package:makers_hackathon/features/auth/Registation/Data/Models/registration_request_model.dart';
import 'package:makers_hackathon/features/auth/Registation/Logic/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState>{
  final RegistationApiService apiService ;

   RegistrationCubit({required this.apiService}) : super(RegistrationInitial());

  Future<void> register(RegistrationRequestModel registrationRequestModel) async {
    emit(RegistrationLoading());

    try {
      final response = await apiService.register(registrationRequestModel);

      if (response.statusCode == 201 && response.success) {
        // TODO: Store token securely using flutter_secure_storage
        // await secureStorage.write(key: 'auth_token', value: response.data.token);
        // TODO: Store user data if needed
        emit(RegistrationSuccess(response.message));
      } else if (response.statusCode == 401) {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.unauthorizedError));
      } else if (response.statusCode == 500) {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.internalServerError));
      } else {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.unknownError));
      }
    } catch (e) {
      emit(RegistrationFailure(ApiErrors.unknownError));
    }
  }
}