// product_model.dart

enum AvailabilityStatus { inStock, outOfStock }

AvailabilityStatus parseAvailability(String value) {
  switch (value.trim().toLowerCase()) {
    case 'in stock':
      return AvailabilityStatus.inStock;
    case 'out of stock':
      return AvailabilityStatus.outOfStock;
    default:
      return AvailabilityStatus.inStock;
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final AvailabilityStatus availabilityStatus;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.availabilityStatus,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      availabilityStatus: parseAvailability(
        json['availabilityStatus'] ?? "In Stock",
      ),
      thumbnail: json['thumbnail'],
    );
  }
}

class Welcome {
  final List<Product> products;

  Welcome({required this.products});

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      products: List<Product>.from(
        json["products"].map((x) => Product.fromJson(x)),
      ),
    );
  }
}
