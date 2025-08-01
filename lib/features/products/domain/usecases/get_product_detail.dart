import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductDetail {
  final ProductsRepository repository;

  GetProductDetail(this.repository);

  Future<Product> call(int productId) async {
    return await repository.getProductById(productId);
  }
}