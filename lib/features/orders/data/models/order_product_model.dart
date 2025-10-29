
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';

import '../../domain/entites/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final double price;
  final String code;
  final String imageUrl;
  final int quantity;

  OrderProductModel({
    required this.code,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
    );
  }

  OrderProductEntity toEntity(){
    return OrderProductEntity(
      name: name,
      price: price,
      code: code,
      imageUrl: imageUrl,
      quantity: quantity,

    );
  }


  toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }
}
