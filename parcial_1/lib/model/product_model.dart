class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final List<String> images;
  final double rating;
  final int stock;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.images,
    required this.rating,
    required this.stock,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      category: json['category'] ?? '',
    );
  }
}
