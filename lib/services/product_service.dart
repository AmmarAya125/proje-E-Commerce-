import '../models/product.dart';

class ProductService {
  final List<Product> _mockProducts = [
    Product(
      id: '1',
      name: 'T-shirt SUP4 DEV',
      description: '100% coton',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150',
      stock: 15,
      isFeatured: true,
    ),
    Product(
      id: '2',
      name: 'Casquette DEV',
      description: 'Cool cap',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150',
      stock: 10,
      isFeatured: false,
    ),
  ];

  Future<List<Product>> fetchProducts() async {
    // simulation d'appel API
    await Future.delayed(Duration(milliseconds: 500));
    return _mockProducts;
  }
}
