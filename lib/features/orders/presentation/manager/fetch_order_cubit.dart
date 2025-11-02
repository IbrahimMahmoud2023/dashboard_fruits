import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/orders_repos/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../domain/entites/order_entity.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.orderRepo) : super(FetchOrderInitial());
  final OrderRepo orderRepo;

  Future <void> fetchOrders() async {
    emit(FetchOrderLoading());
     orderRepo.fetchOrders();


  }
}
