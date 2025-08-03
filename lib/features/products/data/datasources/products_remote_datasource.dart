import 'package:flutter_app_01/features/products/domain/entities/product.dart';

import '../../../../core/datasources/base_remote_datasource.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}

class ProductsRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(super.apiClient);

  @override
  Future<List<Product>> getProducts() async {
    return handleRequest(apiClient.get('/products'), (responseData) {
      final items = responseData['products'] as List;
      return items
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Product> getProductById(int id) async {
    return handleRequest(apiClient.get('/products/$id'), (responseData) {
      return Product.fromJson(responseData as Map<String, dynamic>);
    });
  }

  @override
  Future<Product> createProduct(Product product) async {
    return handleRequest(apiClient.post('/products', data: product.toJson()), (
      responseData,
    ) {
      return Product.fromJson(responseData as Map<String, dynamic>);
    });
  }

  @override
  Future<Product> updateProduct(Product product) async {
    return handleRequest(
      apiClient.put('/products/${product.id}', data: product.toJson()),
      (responseData) {
        return Product.fromJson(responseData as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<void> deleteProduct(int id) async {
    return handleVoidRequest(apiClient.delete('/products/$id'));
  }
}
