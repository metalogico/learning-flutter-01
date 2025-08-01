import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_datasource.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    // Chiama API, ottiene ProductModel, converte in Product (Entity)
    final productModels = await remoteDataSource.getProducts();
    return productModels.cast<Product>();
  }

  @override
  Future<Product> getProductById(int id) async {
    final productModel = await remoteDataSource.getProductById(id);
    return productModel; // ProductModel extends Product, quindi cast automatico
  }

  @override
  Future<Product> createProduct(Product product) async {
    // Converte Entity in Model per l'API
    final productModel = ProductModel.fromEntity(product);
    final createdModel = await remoteDataSource.createProduct(productModel);
    return createdModel; // Ritorna come Entity
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final productModel = ProductModel.fromEntity(product);
    final updatedModel = await remoteDataSource.updateProduct(productModel);
    return updatedModel;
  }

  @override
  Future<void> deleteProduct(int id) async {
    await remoteDataSource.deleteProduct(id);
  }
}