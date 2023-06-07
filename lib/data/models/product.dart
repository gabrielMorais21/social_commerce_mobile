class Product {
  String name;
  String description;
  double price;
  String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  static List<Product> toProducts(List<Map<String, dynamic>> productList) {
    List<Product> products = [];

    for (var productMap in productList) {
      String name = productMap['name'];
      String description = productMap['description'];
      double price = productMap['price'].toDouble();
      String imageUrl = productMap['imageUrl'];

      Product product = Product(
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
      );

      products.add(product);
    }

    return products;
  }
}
