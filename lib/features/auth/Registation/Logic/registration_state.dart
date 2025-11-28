import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable{
  @override
  List<Object?> get props => [] ;
}

class RegistationInitial extends RegistrationState {}

class RegistationLoading extends RegistrationState {}

class RegistationSuccess extends RegistrationState {}

class RegistationFailure extends RegistrationState {}

