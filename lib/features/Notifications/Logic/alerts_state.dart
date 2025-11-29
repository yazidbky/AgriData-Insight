import 'package:equatable/equatable.dart';
import 'package:makers_hackathon/features/Notifications/Data/Models/Sub%20Models/alerts_data_model.dart';

abstract class AlertsState extends Equatable {
  const AlertsState();

  @override
  List<Object?> get props => [];
}

class AlertsInitial extends AlertsState {}

class AlertsLoading extends AlertsState {}

class AlertsSuccess extends AlertsState {
  final AlertsDataModel alertsData;
  final String message;

  const AlertsSuccess({
    required this.alertsData,
    required this.message,
  });

  @override
  List<Object?> get props => [alertsData, message];
}

class AlertsFailure extends AlertsState {
  final String failureMessage;

  const AlertsFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}

