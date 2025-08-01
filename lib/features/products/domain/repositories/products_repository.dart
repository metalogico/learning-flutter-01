import '../entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}