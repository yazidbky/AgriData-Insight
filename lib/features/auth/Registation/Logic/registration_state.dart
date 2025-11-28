import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable{
  const RegistrationState() ;
  @override
  List<Object?> get props => [] ;
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String successMessage ;
   const RegistrationSuccess(this.successMessage);

   @override
   List<Object?> get props => [successMessage]; 

}

class RegistrationFailure extends RegistrationState {
  final String failureMessage ;
  const RegistrationFailure(this.failureMessage);

  @override 
  List<Object?> get props => [failureMessage];
}

