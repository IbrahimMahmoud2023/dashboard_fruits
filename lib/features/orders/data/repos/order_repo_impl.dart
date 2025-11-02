import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_services.dart';

import 'package:fruits_hub_dashboard/features/orders/domain/entites/order_entity.dart';

import '../../../../core/utils/backend_point.dart';
import '../../domain/orders_repos/orders_repo.dart';

class OrdersRepoImpl implements OrderRepo {
  final DataBaseServices dataBaseServices;
  OrdersRepoImpl({required this.dataBaseServices});

  @override
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders() async* {
    try {
      final data = await dataBaseServices.getData(path: BackEndEndPoint.kGetOrders);
      List<OrderEntity> orders = (data as List)
          .map((e) => OrderEntity.fromJson(e))
          .toList();

      yield Right(orders);
    } catch (e) {
      yield Left(Failures(errorMessage: 'failed to fetch data'));
    }
  }
}
