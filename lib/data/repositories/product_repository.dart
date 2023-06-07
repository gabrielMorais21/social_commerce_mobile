import 'package:dio/dio.dart';
import 'package:social_commerce_mobile/consts/consts.dart';
import 'package:social_commerce_mobile/data/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>>  getProducts();
}

class ProductRepositoryImp implements ProductRepository {
  final Dio httpclient;

  ProductRepositoryImp({
    required this.httpclient,
  }) {
    httpclient.options.baseUrl = API_URL_BASE;
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await httpclient.get(
        '/Product',
      );

      List<Product> products = Product.toProducts(response.data ?? []);
      return products;
    } catch (e) {
      throw Exception('Product failed.');
    }
  }
}
