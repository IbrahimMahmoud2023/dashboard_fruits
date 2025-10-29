import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: 'Add Data',
          ),
          SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersView.routeName);
            },
            text: 'View Order',
          ),
        ],
      ),
    );
  }
}
