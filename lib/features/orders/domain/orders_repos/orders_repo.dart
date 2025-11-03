import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';
import '../../../../core/enums/order_enum.dart';

abstract class OrderRepo {
  Stream<Either<Failures,List<OrderEntity>>> fetchOrders();
  Future<Either<Failures,List<OrderEntity>>> updateOrder({required OrderStatus status,required String orderId});
}