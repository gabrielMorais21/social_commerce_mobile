import 'package:dio/dio.dart';
import 'package:social_commerce_mobile/data/models/user.dart';


abstract class RegistrationRepository {
    Future<void> registerUser(User user);
}
class RegistrationRepositoryImp implements RegistrationRepository {
  final Dio httpclient;

  RegistrationRepositoryImp({required this.httpclient});

  @override
  Future<void> registerUser(User user) async {
    try {
 await httpclient.post('/customers', data: user.toJson());
    } catch (e) {
      throw Exception('User registration failed.');
    }
  }
}
