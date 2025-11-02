import 'package:fruits_hub_dashboard/features/orders/domain/entites/address_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_product_entity.dart';

import '../enums/order_enum.dart';

OrderEntity getDummyOrderData() {
  // 🏠 Address Data
  final address = AddressEntity(
    name: "Ibrahim Embaby",
    email: "ibrahim@example.com",
    address: "123 Nile Street",
    floor: "3",
    city: "Cairo",
    phone: "+201234567890",
  );

  // 🛒 Ordered Products
  final products = [
    OrderProductEntity(
      code: "P001",
      name: "Fresh Mango Box",
      price: 25.0,
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/mango-1239349_1280.jpg",
      quantity: 2,
    ),
    OrderProductEntity(
      code: "P002",
      name: "Red Apples (1kg)",
      price: 18.5,
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/02/01/17/30/apple-256261_1280.jpg",
      quantity: 3,
    ),
    OrderProductEntity(
      code: "P003",
      name: "Organic Bananas",
      price: 12.0,
      imageUrl:
          "https://cdn.pixabay.com/photo/2018/03/19/16/37/bananas-3244492_1280.jpg",
      quantity: 1,
    ),
  ];

  // 💰 Calculate Total
  final totalPrice = products.fold(
    0.0,
    (sum, item) => sum + (item.price * item.quantity),
  );

  // 💳 Build the Order Model
  return OrderEntity(
    status: OrderStatus.pending,
    totalPrice: totalPrice,
    uId: "ORD001",
    addressEntity: address,
    paymentMethod: 'cash',
    orderProductEntity: products,
  );
}
