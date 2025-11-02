import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item_list_view.dart';
import '../../../../../core/helper_function/get_order_dummy_data.dart';
import '../../../domain/entites/order_entity.dart';
import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          SizedBox(height: 16),
          Expanded(
            child: OrderItemListView(orderModel: [
              getDummyOrderData(),
              getDummyOrderData(),
              getDummyOrderData(),
            ]),
          )

        ],
      ),
    );
  }
}


