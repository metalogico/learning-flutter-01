import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/products_remote_datasource.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_product_detail.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/update_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/entities/product.dart';
import '../../../../core/providers/core_providers.dart';

// =============================================================================
// DATA LAYER PROVIDERS
// =============================================================================

final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((ref) {
  return ProductsRemoteDataSourceImpl(ref.read(apiClientProvider));
});

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepositoryImpl(ref.read(productsRemoteDataSourceProvider));
});

// =============================================================================
// USE CASES PROVIDERS
// =============================================================================

final getProductsUseCaseProvider = Provider<GetProductsCase>((ref) {
  return GetProductsCase(ref.read(productsRepositoryProvider));
});

final getProductDetailUseCaseProvider = Provider<GetProductDetailCase>((ref) {
  return GetProductDetailCase(ref.read(productsRepositoryProvider));
});

final createProductUseCaseProvider = Provider<CreateProductCase>((ref) {
  return CreateProductCase(ref.read(productsRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProductCase>((ref) {
  return UpdateProductCase(ref.read(productsRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider<DeleteProductCase>((ref) {
  return DeleteProductCase(ref.read(productsRepositoryProvider));
});

// =============================================================================
// STATE PROVIDERS (per le UI)
// =============================================================================

// Provider per gestire refresh manuale della lista
final productsRefreshProvider = StateProvider<int>((ref) => 0);

// Lista prodotti con refresh automatico
final productsListProvider = FutureProvider<List<Product>>((ref) async {

  ref.watch(productsRefreshProvider);

  final getProducts = ref.read(getProductsUseCaseProvider);
  return await getProducts.call();
});

// Dettaglio prodotto per ID
final productDetailProvider = FutureProvider.family<Product, int>((ref, productId) async {
  final getProductDetail = ref.read(getProductDetailUseCaseProvider);
  return await getProductDetail.call(productId);
});
