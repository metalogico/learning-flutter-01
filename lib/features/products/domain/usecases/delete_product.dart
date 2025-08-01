import '../repositories/products_repository.dart';

class DeleteProduct {
  final ProductsRepository repository;

  DeleteProduct(this.repository);

  Future<void> call(int productId) async {
    if (productId <= 0) {
      throw ArgumentError('Invalid product ID');
    }

    return await repository.deleteProduct(productId);
  }
}