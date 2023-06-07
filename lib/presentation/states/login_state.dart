import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
}


class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailureState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {

  LoginSuccessState();

  @override
  List<Object> get props => [];
}