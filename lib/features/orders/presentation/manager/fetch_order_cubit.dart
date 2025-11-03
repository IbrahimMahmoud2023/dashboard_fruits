

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/orders_repos/orders_repo.dart';
import 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.orderRepo) : super(FetchOrderInitial());
  final OrderRepo orderRepo;
  StreamSubscription? streamSubscription;

  void fetchOrders() {
    emit(FetchOrderLoading());
    streamSubscription = orderRepo.fetchOrders().listen((data) {
      data.fold(
        (l) => emit(FetchOrderFailure(errorMessage: l.errorMessage)),

        (r) => emit(FetchOrderSuccess(orders: r)),
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
