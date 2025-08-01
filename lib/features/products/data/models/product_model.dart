import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
    required super.category,
  });

  // FROM JSON - Laravel API Response
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['title'] as String,        // title → name
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,  // Nuovo campo
    );
  }

  // TO JSON - Per POST/PUT requests a Laravel
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'category': category,
    };
  }

  // FROM Entity - Quando ricevi Product da UI e devi inviarlo all'API
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
      category: product.category,
    );
  }

  // Utility per debug
  @override
  String toString() => 'ProductModel(${super.toString()})';
}