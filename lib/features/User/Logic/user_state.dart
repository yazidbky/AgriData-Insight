import 'package:equatable/equatable.dart';
import 'package:makers_hackathon/features/User/Data/Models/Sub%20Models/user_data_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserDataModel userData;
  final String message;

  const UserSuccess({
    required this.userData,
    required this.message,
  });

  @override
  List<Object?> get props => [userData, message];
}

class UserFailure extends UserState {
  final String failureMessage;

  const UserFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}

