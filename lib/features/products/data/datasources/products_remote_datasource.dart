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
      // QUI la feature sa come gestire DummyJSON
      final List<dynamic> items;

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('products')) {
        // DummyJSON format: {"products": [...], "total": 100}
        items = responseData['products'];
      } else if (responseData is List) {
        // Direct array format: [...]
        items = responseData;
      } else {
        throw FormatException(
          'Unexpected response format: ${responseData.runtimeType}',
        );
      }

      return items
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    return handleRequest(apiClient.get('/products/$id'), (responseData) {
      // Gestione specifica per singolo prodotto
      Map<String, dynamic> productData;

      if (responseData is Map<String, dynamic>) {
        // Potrebbe essere {"data": {...}} o direttamente {...}
        productData = responseData.containsKey('data')
            ? responseData['data']
            : responseData;
      } else {
        throw FormatException(
          'Expected Map but got ${responseData.runtimeType}',
        );
      }

      return ProductModel.fromJson(productData);
    });
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    return handleRequest(apiClient.post('/products', data: product.toJson()), (
      responseData,
    ) {
      final productData =
          responseData is Map<String, dynamic> &&
              responseData.containsKey('data')
          ? responseData['data']
          : responseData;
      return ProductModel.fromJson(productData as Map<String, dynamic>);
    });
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    return handleRequest(
      apiClient.put('/products/${product.id}', data: product.toJson()),
      (responseData) {
        final productData =
            responseData is Map<String, dynamic> &&
                responseData.containsKey('data')
            ? responseData['data']
            : responseData;
        return ProductModel.fromJson(productData as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<void> deleteProduct(int id) async {
    return handleVoidRequest(apiClient.delete('/products/$id'));
  }
}
