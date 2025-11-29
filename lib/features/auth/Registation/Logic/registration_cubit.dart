import 'package:bloc/bloc.dart';
import 'package:makers_hackathon/core/Database/Local/local_storage.dart';
import 'package:makers_hackathon/core/Errors/api_errors.dart' show ApiErrors;
import 'package:makers_hackathon/core/Errors/exceptions.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Api/registation_api_service.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Models/registration_request_model.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState>{
  final RegistationApiService apiService ;

   RegistrationCubit({required this.apiService}) : super(RegistrationInitial());

  Future<void> register(RegistrationRequestModel registrationRequestModel) async {
    emit(RegistrationLoading());

    try {
      final response = await apiService.register(registrationRequestModel);

      if (response.statusCode == 201 && response.success) {
        // Store token securely in local storage
        await LocalStorage.setSecureData('access_token', response.data.token);
        
        // Store user info
        await LocalStorage.storeUserInfo(
          userId: response.data.farmer.id.toString(),
          email: response.data.farmer.email,
        );
        
        emit(RegistrationSuccess(response.message));
      } else if (response.statusCode == 401) {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.unauthorizedError));
      } else if (response.statusCode == 500) {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.internalServerError));
      } else {
        emit(RegistrationFailure(response.message.isNotEmpty ? response.message : ApiErrors.unknownError));
      }
    } on ServerException catch (e) {
      emit(RegistrationFailure(e.errorModel.message));
    } catch (e) {
      emit(RegistrationFailure(ApiErrors.unknownError));
    }
  }
}