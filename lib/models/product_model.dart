class ProductModel {
  final String id;
  final String name;
  final int price;
  final String image;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  ProductModel copyWith({String? id, String? name, int? price, String? image}) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price, 'image': image};
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price)';
  }
}
