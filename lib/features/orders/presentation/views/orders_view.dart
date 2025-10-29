import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrdersViewBody(),
    );
  }
}
