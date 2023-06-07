import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
}


class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeFailureState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {

  HomeSuccessState();

  @override
  List<Object> get props => [];
}