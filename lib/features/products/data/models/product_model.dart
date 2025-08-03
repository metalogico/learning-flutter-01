import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.rating,
    required super.description,
    required super.category,
    required super.thumbnail,
    required super.brand,
    required super.sku,
    required super.stock,
  });

  // FROM JSON - Laravel API Response
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toInt(),
      name: json['title'].toString(),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      description: json['description'].toString(),
      category: json['category'].toString(),
      thumbnail: json['thumbnail'].toString(),
      brand: json['brand'].toString(),
      sku: json['sku'].toString(),
      stock: (json['stock'] as num).toInt(),
    );
  }

  // TO JSON - Per POST/PUT requests a Laravel
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'rating': rating,
      'description': description,
      'category': category,
      'thumbnail': thumbnail,
      'brand': brand,
      'sku': sku,
      'stock': stock,
    };
  }

  // FROM Entity - Quando ricevi Product da UI e devi inviarlo all'API
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      rating: product.rating,
      description: product.description,
      category: product.category,
      thumbnail: product.thumbnail,
      brand: product.brand,
      sku: product.sku,
      stock: product.stock,
    );
  }

  // Utility per debug
  @override
  String toString() => 'ProductModel(${super.toString()})';
}