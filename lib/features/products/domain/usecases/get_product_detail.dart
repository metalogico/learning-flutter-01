import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductDetailCase {
  final ProductsRepository repository;

  GetProductDetailCase(this.repository);

  Future<Product> call(int productId) async {
    return await repository.getProductById(productId);
  }
}