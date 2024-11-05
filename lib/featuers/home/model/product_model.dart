import 'dart:convert';

List<ProductModel> productModelFromMap(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromMap(x)));

String productModelToMap(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0, // Provide default values to prevent null errors
      title: json["title"] ?? '',
      price: json["price"]?.toDouble() ?? 0.0,
      description: json["description"] ?? '',
      category: json["category"] ?? '',
      image: json["image"] ?? '',
      rating: Rating.fromMap(json["rating"] ?? {}), // Handle possible missing rating
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toMap(),
  };
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) {
    return Rating(
      rate: json["rate"]?.toDouble() ?? 0.0, // Default value for safety
      count: json["count"] ?? 0, // Default value for safety
    );
  }

  Map<String, dynamic> toMap() => {
    "rate": rate,
    "count": count,
  };
}
