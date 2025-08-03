import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      final List<dynamic> data = response.data;
      return data.map((json) {
        return Product.fromJson(json);
      }).toList();
    } catch (e) {
      // In a real app, you'd handle this error more gracefully
      throw Exception('Failed to load products: $e');
    }
  }
}
