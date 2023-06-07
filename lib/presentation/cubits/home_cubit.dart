


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/data/models/product.dart';
import 'package:social_commerce_mobile/data/repositories/product_repository.dart';
import 'package:social_commerce_mobile/presentation/states/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository productRepository;
     List<Product> products = [];


  HomeCubit({required this.productRepository})
      : super(HomeInitialState());

  Future<void> getProducts(String username, String password) async {
    emit(HomeLoadingState());

    try {
      products = await productRepository.getProducts();

      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeFailureState());
    }
  }
}
