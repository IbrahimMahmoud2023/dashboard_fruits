import 'package:fruits_hub_dashboard/features/orders/domain/entites/address_entity.dart';
import '../../../../core/enums/order_enum.dart';
import 'order_product_entity.dart';


class OrderEntity {
  final double totalPrice;
  final String uId;
  final String orderId;
  final AddressEntity addressEntity;

  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;
  final OrderStatus status;

 OrderEntity({
    required this.orderId,
    required this.status,
    required this.totalPrice,
    required this.uId,
    required this.addressEntity,
    required this.orderProductEntity,
    required this.paymentMethod,
});

 factory OrderEntity.fromJson(Map<String, dynamic> json) {
   return OrderEntity(
     orderId: json['orderId'],
     status: json['status'],
     totalPrice: json['totalPrice'],
     uId: json['uId'],
     addressEntity: AddressEntity.fromJson(json['addressEntity']),
     orderProductEntity: (json['orderProductEntity'] as List)
         .map((e) => OrderProductEntity.fromJson(e))
         .toList(),
     paymentMethod: json['paymentMethod'],

   );
 }

  }




