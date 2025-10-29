import 'package:flutter/cupertino.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';
import 'order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderModel});
final List<OrderEntity> orderModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModel.length,
        itemBuilder: (context, index) {
       return OrderItemWidget(orderModel: orderModel[index],);
        },
    );
  }
}
