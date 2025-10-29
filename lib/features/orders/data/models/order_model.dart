import '../../domain/entites/order_entity.dart';
import 'address_model.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final AddressModel addressModel;

  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.addressModel,
    required this.orderProductModel,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      addressModel: AddressModel.fromJson(json['addressModel']),
      orderProductModel: List<OrderProductModel>.from(
        json['orderProductModel'].map((e) => OrderProductModel.fromJson(e)),
      ),
      paymentMethod: json['paymentMethod'],
    );
  }

  toEntity(){
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      addressEntity: addressModel.toEntity(),
      orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }


  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'addressModel': addressModel.toJason(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

}
