
class OrderProductEntity {
  final String name;
  final double price;
  final String code;
  final String imageUrl;
  final int quantity;

  OrderProductEntity({
    required this.code,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
  factory OrderProductEntity.fromJson(Map<String, dynamic> json) {

    return OrderProductEntity(
      code: json['code'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
    );
  }


}
