import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:makers_hackathon/core/Database/dio_consumer.dart';
import 'package:makers_hackathon/features/Auth/Login/Data/Api/login_api_service.dart';
import 'package:makers_hackathon/features/Auth/Login/Logic/login_cubit.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Api/registation_api_service.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_cubit.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Data/Api/soil_status_api_service.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Logic/soil_status_cubit.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Data/Api/weather_status_api_service.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Logic/weather_status_cubit.dart';
import 'package:makers_hackathon/features/Notifications/Data/Api/alerts_api_service.dart';
import 'package:makers_hackathon/features/Notifications/Logic/alerts_cubit.dart';
import 'package:makers_hackathon/features/Recommendation/Data/Api/recommendation_api_service.dart';
import 'package:makers_hackathon/features/Recommendation/Logic/recommendation_cubit.dart';
import 'package:makers_hackathon/features/User/Data/Api/user_api_service.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Data/Api/weather_api_service.dart';
import 'package:makers_hackathon/features/Weather%20Charts/Logic/weather_cubit.dart';

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

  // WeatherApiService
  getIt.registerLazySingleton<WeatherApiService>(
    () => WeatherApiService(getIt<DioConsumer>()),
  );

  // WeatherCubit
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt<WeatherApiService>()),
  );

  // AlertsApiService
  getIt.registerLazySingleton<AlertsApiService>(
    () => AlertsApiService(getIt<DioConsumer>()),
  );

  // AlertsCubit
  getIt.registerFactory<AlertsCubit>(
    () => AlertsCubit(getIt<AlertsApiService>()),
  );

  // RecommendationApiService
  getIt.registerLazySingleton<RecommendationApiService>(
    () => RecommendationApiService(getIt<DioConsumer>()),
  );

  // RecommendationCubit
  getIt.registerFactory<RecommendationCubit>(
    () => RecommendationCubit(getIt<RecommendationApiService>()),
  );

  // SoilStatusApiService
  getIt.registerLazySingleton<SoilStatusApiService>(
    () => SoilStatusApiService(getIt<DioConsumer>()),
  );

  // SoilStatusCubit
  getIt.registerFactory<SoilStatusCubit>(
    () => SoilStatusCubit(getIt<SoilStatusApiService>()),
  );

  // WeatherStatusApiService
  getIt.registerLazySingleton<WeatherStatusApiService>(
    () => WeatherStatusApiService(getIt<DioConsumer>()),
  );

  // WeatherStatusCubit
  getIt.registerFactory<WeatherStatusCubit>(
    () => WeatherStatusCubit(getIt<WeatherStatusApiService>()),
  );
}