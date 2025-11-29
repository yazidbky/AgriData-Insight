import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:makers_hackathon/core/Database/dio_consumer.dart';
import 'package:makers_hackathon/features/Auth/Login/Data/Api/login_api_service.dart';
import 'package:makers_hackathon/features/Auth/Login/Logic/login_cubit.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Api/registation_api_service.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_cubit.dart';
import 'package:makers_hackathon/features/User/Data/Api/user_api_service.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // ApiConsumer
  getIt.registerLazySingleton<DioConsumer>(
    () => DioConsumer(getIt<Dio>()),
  );

  // LoginApiService
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(getIt<DioConsumer>()),
  );

  // LoginCubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<LoginApiService>()),
  );

  // RegistrationApiService
  getIt.registerLazySingleton<RegistationApiService>(
    () => RegistationApiService(getIt<DioConsumer>()),
  );

  // RegistrationCubit
  getIt.registerFactory<RegistrationCubit>(
    () => RegistrationCubit(apiService: getIt<RegistationApiService>()),
  );

  // UserApiService
  getIt.registerLazySingleton<UserApiService>(
    () => UserApiService(getIt<DioConsumer>()),
  );

  // UserCubit
  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserApiService>()),
  );
}