class Products {
  final String id; // Add an ID field
  final String? title;
  final String? brand;
  final double? price;
  final double? discountPercentage;
  final String? thumbnail;
  final int quantity; // ✅ Add this field

  Products({
    required this.id,
    this.title,
    this.brand,
    this.price,
    this.discountPercentage,
    this.thumbnail,
    this.quantity = 1, // ✅ Provide a default value
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      title: json['title'],
      brand: json['brand'],
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'],
      quantity: 1, id: '', // ✅ Ensure quantity is always initialized
    );
  }

  Products copyWith({
    String? title,
    String? brand,
    double? price,
    double? discountPercentage,
    String? thumbnail,
    int? quantity,
  }) {
    return Products(
      title: title ?? this.title,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      thumbnail: thumbnail ?? this.thumbnail,
      quantity: quantity ?? this.quantity, id: '',
    );
  }
}
