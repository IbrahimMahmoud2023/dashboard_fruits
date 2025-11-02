
import 'package:flutter/material.dart';

import '../enums/order_enum.dart';

 Color getStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return Colors.orange;

    case OrderStatus.delivered:
      return Colors.green;
    case OrderStatus.cancelled:
      return Colors.red;
    default:
      return Colors.grey;
  }
}