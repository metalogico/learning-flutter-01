import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final String description;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  });

  // Business Logic Methods
  bool get isExpensive => price > 1000.0;

  String get formattedPrice => '€${price.toStringAsFixed(2)}';

  String get shortDescription => description.length > 100
    ? '${description.substring(0, 100)}...'
    : description;

  // Equatable gestisce automaticamente == e hashCode
  @override
  List<Object?> get props => [id, name, price, description, category];

  // Cambia business logic:
  bool get isPopular => category == 'smartphones' || category == 'laptops';

  @override
  String toString() => 'Product(id: $id, name: $name, price: $formattedPrice)';

  // CopyWith per immutabilità
  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }
}