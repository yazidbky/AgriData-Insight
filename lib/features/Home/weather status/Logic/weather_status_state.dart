import 'package:equatable/equatable.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Data/Models/Sub%20Models/weather_status_data_model.dart';

abstract class WeatherStatusState extends Equatable {
  const WeatherStatusState();

  @override
  List<Object?> get props => [];
}

class WeatherStatusInitial extends WeatherStatusState {}

class WeatherStatusLoading extends WeatherStatusState {}

class WeatherStatusSuccess extends WeatherStatusState {
  final WeatherStatusDataModel weatherStatusData;
  final String message;

  const WeatherStatusSuccess({
    required this.weatherStatusData,
    required this.message,
  });

  @override
  List<Object?> get props => [weatherStatusData, message];
}

class WeatherStatusFailure extends WeatherStatusState {
  final String failureMessage;

  const WeatherStatusFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}

