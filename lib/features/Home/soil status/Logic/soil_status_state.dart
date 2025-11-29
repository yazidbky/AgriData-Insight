import 'package:equatable/equatable.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Data/Models/Sub%20Models/soil_status_data_model.dart';

abstract class SoilStatusState extends Equatable {
  const SoilStatusState();

  @override
  List<Object?> get props => [];
}

class SoilStatusInitial extends SoilStatusState {}

class SoilStatusLoading extends SoilStatusState {}

class SoilStatusSuccess extends SoilStatusState {
  final SoilStatusDataModel soilStatusData;
  final String message;

  const SoilStatusSuccess({
    required this.soilStatusData,
    required this.message,
  });

  @override
  List<Object?> get props => [soilStatusData, message];
}

class SoilStatusFailure extends SoilStatusState {
  final String failureMessage;

  const SoilStatusFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}

