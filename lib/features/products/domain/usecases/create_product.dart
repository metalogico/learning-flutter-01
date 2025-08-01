import '../entities/product.dart';
import '../repositories/products_repository.dart';

class CreateProduct {
  final ProductsRepository repository;

  CreateProduct(this.repository);

  Future<Product> call(Product product) async {
    // Validation business rules
    if (product.name.isEmpty) {
      throw ArgumentError('Product name cannot be empty');
    }

    if (product.price < 0) {
      throw ArgumentError('Product price must be positive');
    }

    if (product.description.isEmpty) {
      throw ArgumentError('Product description cannot be empty');
    }

    return await repository.createProduct(product);
  }
}