import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../manager/update_order/update_order_cubit.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatus.pending,
          child: ElevatedButton(onPressed: () {
            context.read<UpdateOrderCubit>().updateOrder(status: OrderStatus.pending, orderId: orderEntity.orderId);
          }, child: Text('pending')),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatus.accepted,
          child: ElevatedButton(onPressed: () {
            context.read<UpdateOrderCubit>().updateOrder(status: OrderStatus.accepted, orderId: orderEntity.orderId);
          }, child: Text('accept')),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatus.delivered,
          child: ElevatedButton(onPressed: () {
            context.read<UpdateOrderCubit>().updateOrder(status: OrderStatus.delivered, orderId: orderEntity.orderId);
          }, child: Text('delivered')),
        ),

        Visibility(
          visible: orderEntity.status == OrderStatus.cancelled,
          child: ElevatedButton(onPressed: () {
            context.read<UpdateOrderCubit>().updateOrder(status: OrderStatus.cancelled, orderId: orderEntity.orderId);
          }, child: Text('cancel')),
        ),
      ],
    );
  }
}
