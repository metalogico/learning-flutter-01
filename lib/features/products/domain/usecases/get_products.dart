import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductsCase {
  final ProductsRepository repository;

  GetProductsCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}