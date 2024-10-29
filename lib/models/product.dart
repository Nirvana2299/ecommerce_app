class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double ratingRate;
  final int ratingCount;

  Product({required this.id, required this.title, required this.description, required this.image, required this.price, required this.ratingRate, required this.ratingCount});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'] as double,
      ratingRate: (json['rating']['rate'] is int)
          ? (json['rating']['rate'] as int).toDouble()
          : (json['rating']['rate'] as double),
      ratingCount: json['rating']['count'],
    );
  }
}
