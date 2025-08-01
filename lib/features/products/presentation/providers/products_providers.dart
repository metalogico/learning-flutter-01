// ===================================================================
// PROVIDERS LAYER - Riverpod State Management
// ===================================================================

// features/products/presentation/providers/products_providers.dart
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
import '../../../../core/errors/app_exception.dart';

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

final getProductsUseCaseProvider = Provider<GetProducts>((ref) {
  return GetProducts(ref.read(productsRepositoryProvider));
});

final getProductDetailUseCaseProvider = Provider<GetProductDetail>((ref) {
  return GetProductDetail(ref.read(productsRepositoryProvider));
});

final createProductUseCaseProvider = Provider<CreateProduct>((ref) {
  return CreateProduct(ref.read(productsRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProduct>((ref) {
  return UpdateProduct(ref.read(productsRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider<DeleteProduct>((ref) {
  return DeleteProduct(ref.read(productsRepositoryProvider));
});

// =============================================================================
// STATE PROVIDERS (per le UI)
// =============================================================================

// Lista prodotti con refresh automatico
final productsListProvider = FutureProvider<List<Product>>((ref) async {
  final getProducts = ref.read(getProductsUseCaseProvider);
  return await getProducts.call();
});

// Dettaglio prodotto per ID
final productDetailProvider = FutureProvider.family<Product, int>((ref, productId) async {
  final getProductDetail = ref.read(getProductDetailUseCaseProvider);
  return await getProductDetail.call(productId);
});

// Provider per gestire refresh manuale della lista
final productsRefreshProvider = StateProvider<int>((ref) => 0);

// Lista prodotti che si refresh quando cambia productsRefreshProvider
final refreshableProductsListProvider = FutureProvider<List<Product>>((ref) async {
  // Watching per auto-refresh
  ref.watch(productsRefreshProvider);

  final getProducts = ref.read(getProductsUseCaseProvider);
  return await getProducts.call();
});

// =============================================================================
// FORM STATE MANAGEMENT
// =============================================================================

// State per il form di creazione/modifica
class ProductFormState {
  final bool isLoading;
  final String? generalError;
  final bool isSuccess;
  final Map<String, String> fieldErrors;

  ProductFormState({
    this.isLoading = false,
    this.generalError,
    this.isSuccess = false,
    this.fieldErrors = const {},
  });

  ProductFormState copyWith({
    bool? isLoading,
    String? generalError,
    bool? isSuccess,
    Map<String, String>? fieldErrors,
  }) {
    return ProductFormState(
      isLoading: isLoading ?? this.isLoading,
      generalError: generalError ?? this.generalError,
      isSuccess: isSuccess ?? this.isSuccess,
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  // Helper methods
  bool hasFieldError(String field) => fieldErrors.containsKey(field);
  String? getFieldError(String field) => fieldErrors[field];
  bool get hasAnyError => generalError != null || fieldErrors.isNotEmpty;
  bool get isIdle => !isLoading && !isSuccess && !hasAnyError;
}

// Notifier per gestire il form
class ProductFormNotifier extends StateNotifier<ProductFormState> {
  final CreateProduct _createProduct;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;
  final Ref _ref;

  ProductFormNotifier(
    this._createProduct,
    this._updateProduct,
    this._deleteProduct,
    this._ref,
  ) : super(ProductFormState());

  Future<void> createProduct(Product product) async {
    state = state.copyWith(isLoading: true, generalError: null, fieldErrors: {});

    try {
      await _createProduct.call(product);
      state = state.copyWith(isLoading: false, isSuccess: true);

      // Refresh della lista prodotti
      _ref.read(productsRefreshProvider.notifier).state++;

    } on ValidationException catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: e.message,
        fieldErrors: e.firstErrorPerField,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: 'Errore sconosciuto: $e',
      );
    }
  }

  Future<void> updateProduct(Product product) async {
    state = state.copyWith(isLoading: true, generalError: null, fieldErrors: {});

    try {
      await _updateProduct.call(product);
      state = state.copyWith(isLoading: false, isSuccess: true);

      // Refresh della lista prodotti
      _ref.read(productsRefreshProvider.notifier).state++;

      // Invalida anche il dettaglio specifico
      _ref.invalidate(productDetailProvider(product.id));

    } on ValidationException catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: e.message,
        fieldErrors: e.firstErrorPerField,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: 'Errore sconosciuto: $e',
      );
    }
  }

  Future<void> deleteProduct(int productId) async {
    state = state.copyWith(isLoading: true, generalError: null);

    try {
      await _deleteProduct.call(productId);
      state = state.copyWith(isLoading: false, isSuccess: true);

      // Refresh della lista prodotti
      _ref.read(productsRefreshProvider.notifier).state++;

    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        generalError: 'Errore sconosciuto: $e',
      );
    }
  }

  void reset() {
    state = ProductFormState();
  }
}

// Provider per il form notifier
final productFormProvider = StateNotifierProvider<ProductFormNotifier, ProductFormState>((ref) {
  return ProductFormNotifier(
    ref.read(createProductUseCaseProvider),
    ref.read(updateProductUseCaseProvider),
    ref.read(deleteProductUseCaseProvider),
    ref,
  );
});