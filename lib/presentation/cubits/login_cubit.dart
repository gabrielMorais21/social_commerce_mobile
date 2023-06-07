// login_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/data/repositories/authentication_repository.dart';
import 'package:social_commerce_mobile/presentation/states/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginCubit({required this.authenticationRepository})
      : super(LoginInitialState());

  Future<void> login(String username, String password) async {
    emit(LoginLoadingState());

    try {
   await authenticationRepository.login(username, password);
      // Save the token to secure storage here

      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
