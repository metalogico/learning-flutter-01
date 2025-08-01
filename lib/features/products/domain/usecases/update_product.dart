import '../entities/product.dart';
import '../repositories/products_repository.dart';

class UpdateProduct {
  final ProductsRepository repository;

  UpdateProduct(this.repository);

  Future<Product> call(Product product) async {
    // Business validation rules
    if (product.id <= 0) {
      throw ArgumentError('Invalid product ID');
    }

    if (product.name.isEmpty) {
      throw ArgumentError('Product name cannot be empty');
    }

    if (product.price < 0) {
      throw ArgumentError('Product price must be positive');
    }

    return await repository.updateProduct(product);
  }
}