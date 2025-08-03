import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../services/product_service.dart';

// 1. Define the states
sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

// 2. Define the Notifier
class ProductNotifier extends StateNotifier<ProductState> {
  final ProductService _productService;

  ProductNotifier(this._productService) : super(ProductInitial()) {
    // Fetch products as soon as the provider is initialized
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      state = ProductLoading();
      final products = await _productService.getProducts();
      state = ProductSuccess(products);
    } catch (e) {
      state = ProductError('Failed to fetch products.');
    }
  }
}

// 3. Define the Provider
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final productProvider =
    StateNotifierProvider.autoDispose<ProductNotifier, ProductState>((ref) {
      final productService = ref.watch(productServiceProvider);
      return ProductNotifier(productService);
    });
