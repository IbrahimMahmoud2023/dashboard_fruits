import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failures,List<OrderEntity>>> fetchOrders();
}