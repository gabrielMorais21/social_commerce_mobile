// Registration_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/data/models/user.dart';

import 'package:social_commerce_mobile/data/repositories/registration_repository.dart';
import 'package:social_commerce_mobile/presentation/states/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository registrationRepository;

  RegistrationCubit({required this.registrationRepository}) : super(RegistrationInitialState());

  Future<void> registerUser(User user) async {
    emit(RegistrationLoadingState());

    try {
      await registrationRepository.registerUser(user);
      emit(RegistrationSuccessState());
    } catch (e) {
      emit(RegistrationFailureState());
    }
  }
}
