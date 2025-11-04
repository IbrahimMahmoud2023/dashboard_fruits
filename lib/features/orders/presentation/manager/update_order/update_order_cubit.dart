import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/orders_repos/orders_repo.dart';

import '../../../../../core/enums/order_enum.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());

  final OrderRepo orderRepo;

  Future<void> updateOrder({
    required OrderStatus status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    var result = await orderRepo.updateOrder(status: status, orderId: orderId);

    result.fold(
      (l) => emit(UpdateOrderFailure(errorMessage: l.errorMessage)),
      (r) => emit(UpdateOrderSuccess()),
    );
  }
}
