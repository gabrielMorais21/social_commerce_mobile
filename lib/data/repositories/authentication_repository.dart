import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:social_commerce_mobile/consts/consts.dart';

abstract class AuthenticationRepository {
   Future<String> login(String username, String password);
}

class AuthenticationRepositoryImp  implements AuthenticationRepository{
  final Dio httpclient;
  final FlutterSecureStorage flutterSecureStorage;

  AuthenticationRepositoryImp({required this.httpclient, required this.flutterSecureStorage}){
      httpclient.options.baseUrl = API_URL_BASE;
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await httpclient.post('/login', data: {
        'username': username,
        'password': password,
      });
      final token = response.data['token'] as String;
      await flutterSecureStorage.write(key: 'token', value: token);
      return token;
    } catch (e) {
      throw Exception('Login failed.');
    }
  }
}
