import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
}


class RegistrationInitialState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationLoadingState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationFailureState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccessState extends RegistrationState {

  RegistrationSuccessState();

  @override
  List<Object> get props => [];
}