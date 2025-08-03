import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final double rating;
  final String description;
  final String category;
  final String thumbnail;
  final String brand;
  final String sku;
  final int stock;


  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.brand,
    required this.sku,
    required this.stock,
  });

  // Business Logic Methods
  bool get isExpensive => price > 1000.0;

  String get formattedPrice => '€${price.toStringAsFixed(2)}';

  String get shortDescription => description.length > 100
    ? '${description.substring(0, 100)}...'
    : description;

  // Equatable gestisce automaticamente == e hashCode
  @override
  List<Object?> get props => [id, name, price, description, category, thumbnail, brand, sku, stock];

  // Cambia business logic:
  bool get isPopular => category == 'smartphones' || category == 'laptops';

  @override
  String toString() => 'Product(id: $id, name: $name, price: $formattedPrice)';

  // CopyWith per immutabilità
  Product copyWith({
    int? id,
    String? name,
    double? price,
    double? rating,
    String? description,
    String? category,
    String? thumbnail,
    String? brand,
    String? sku,
    int? stock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      stock: stock ?? this.stock,
    );
  }
}