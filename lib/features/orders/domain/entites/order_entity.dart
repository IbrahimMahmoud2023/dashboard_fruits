import 'package:fruits_hub_dashboard/features/orders/domain/entites/address_entity.dart';
import 'order_product_entity.dart';


class OrderEntity {
  final double totalPrice;
  final String uId;
  final AddressEntity addressEntity;

  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;

 OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.addressEntity,
    required this.orderProductEntity,
    required this.paymentMethod,
});



}
