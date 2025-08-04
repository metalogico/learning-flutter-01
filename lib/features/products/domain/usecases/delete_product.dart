import '../repositories/products_repository.dart';

class DeleteProductCase {
  final ProductsRepository repository;

  DeleteProductCase(this.repository);

  Future<void> call(int productId) async {
    if (productId <= 0) {
      throw ArgumentError('Invalid product ID');
    }

    return await repository.deleteProduct(productId);
  }
}