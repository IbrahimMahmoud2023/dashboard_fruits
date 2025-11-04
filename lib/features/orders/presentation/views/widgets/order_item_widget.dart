import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_function/get_status_color.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';
import '../../../data/models/order_product_model.dart';
import 'order_action_button.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity orderModel;
  const OrderItemWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏷 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: ${orderModel.uId}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  orderModel.paymentMethod.toUpperCase(),
                  style: TextStyle(
                    color: orderModel.paymentMethod == "cash "
                        ? Colors.green
                        : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(orderModel.status),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderModel.status.name
                        .toUpperCase(), // Converts enum to string
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 🏠 Address Info
            Text(
              "Shipping Address",
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              "${orderModel.addressEntity.name} - ${orderModel.addressEntity.phone}",
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              "${orderModel.addressEntity.address}, floor: ${orderModel.addressEntity.floor}, ${orderModel.addressEntity.city}",
              style: const TextStyle(color: Colors.grey),
            ),

            const Divider(height: 24),

            // 🛒 Product List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderModel.orderProductEntity.length,
              itemBuilder: (context, index) {
                final OrderProductModel product = OrderProductModel.fromEntity(
                  orderModel.orderProductEntity[index],
                );

                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      width: 40,
                      height: 40,
                      placeholder: (context, url) => const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    "Code: ${product.code}\nQty: ${product.quantity}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    "\$${(product.price * product.quantity).toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),

            const Divider(height: 24),

            // 💰 Total Price
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Total: \$${orderModel.totalPrice.toStringAsFixed(2)}",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            OrderActionButton(
              orderEntity: orderModel,
            ),
            
          ],
        ),
      ),
    );
  }
}
