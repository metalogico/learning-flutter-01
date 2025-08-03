import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    @JsonKey(name: 'title') required String name,
    required double price,
    required double rating,
    required String description,
    required String category,
    required String thumbnail,
    String? brand,
    String? sku,
    int? stock,
  }) = _Product;


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

// Business Logic Extension
extension ProductBusinessLogic on Product {
  bool get isExpensive => price > 1000.0;

  String get formattedPrice => '€${price.toStringAsFixed(2)}';

  String get shortDescription => description.length > 100
      ? '${description.substring(0, 100)}...'
      : description;

  bool get isPopular => category == 'smartphones' || category == 'laptops';
}