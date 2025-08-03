class Product {
  final int id;
  final String name;
  final String description;
  final num price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['image'],
    );
  }
}
