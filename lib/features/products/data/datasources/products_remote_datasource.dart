import '../models/product_model.dart';
import '../../../../core/datasources/base_remote_datasource.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(int id);
}

class ProductsRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(super.apiClient);

  @override
  Future<List<ProductModel>> getProducts() async {
    return handleRequest(apiClient.get('/products'), (responseData) {
      final items = responseData['products'] as List;
      return items
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    return handleRequest(apiClient.get('/products/$id'), (responseData) {
      return ProductModel.fromJson(responseData as Map<String, dynamic>);
    });
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    return handleRequest(apiClient.post('/products', data: product.toJson()), (
      responseData,
    ) {
      return ProductModel.fromJson(responseData as Map<String, dynamic>);
    });
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    return handleRequest(
      apiClient.put('/products/${product.id}', data: product.toJson()),
      (responseData) {
        return ProductModel.fromJson(responseData as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<void> deleteProduct(int id) async {
    return handleVoidRequest(apiClient.delete('/products/$id'));
  }
}
