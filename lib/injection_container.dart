import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:social_commerce_mobile/data/repositories/authentication_repository.dart';
import 'package:social_commerce_mobile/data/repositories/product_repository.dart';
import 'package:social_commerce_mobile/data/repositories/registration_repository.dart';
import 'package:social_commerce_mobile/presentation/cubits/home_cubit.dart';
import 'package:social_commerce_mobile/presentation/cubits/login_cubit.dart';
import 'package:social_commerce_mobile/presentation/cubits/registration_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(
    () => LoginCubit(authenticationRepository: sl(),),
  );

  sl.registerFactory(
    () => HomeCubit(productRepository: sl(),),
  );

    sl.registerFactory(
    () => RegistrationCubit(registrationRepository: sl(),),
  );

  // repository
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImp(httpclient: sl(), flutterSecureStorage: sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(httpclient: sl(),));
  sl.registerLazySingleton<RegistrationRepository>(() => RegistrationRepositoryImp(httpclient: sl()));

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
