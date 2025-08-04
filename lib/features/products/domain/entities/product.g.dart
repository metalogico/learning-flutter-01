// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  description: json['description'] as String,
  category: json['category'] as String,
  thumbnail: json['thumbnail'] as String,
  brand: json['brand'] as String?,
  sku: json['sku'] as String?,
  stock: (json['stock'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'rating': instance.rating,
  'description': instance.description,
  'category': instance.category,
  'thumbnail': instance.thumbnail,
  'brand': instance.brand,
  'sku': instance.sku,
  'stock': instance.stock,
};
