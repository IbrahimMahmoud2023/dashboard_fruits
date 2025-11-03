import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/update_order_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper_function/get_order_dummy_data.dart';
import '../../../../core/services/git_it_services.dart';
import '../../domain/orders_repos/orders_repo.dart';
import '../manager/fetch_order_cubit.dart';
import '../manager/fetch_order_state.dart';
import '../manager/update_order/update_order_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
  BlocProvider(create: (context) => FetchOrderCubit(getIt.get<OrderRepo>())),
  BlocProvider(create: (context) => UpdateOrderCubit(getIt.get<OrderRepo>())),
],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
          centerTitle: true,
        ),
        body: UpdateOrderBuilder(child: OrderViewsBodyBlocBuilder()),
      ),
    );
  }
}

class OrderViewsBodyBlocBuilder extends StatefulWidget {
  const OrderViewsBodyBlocBuilder({
    super.key,
  });

  @override
  State<OrderViewsBodyBlocBuilder> createState() => _OrderViewsBodyBlocBuilderState();
}

class _OrderViewsBodyBlocBuilderState extends State<OrderViewsBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrderCubit>().fetchOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrderCubit, FetchOrderState>(
      builder: (context, state) {
        if(state is FetchOrderSuccess){
          return OrdersViewBody(orders: state.orders);
        }else if(state is FetchOrderFailure){
          return Center(child: Text(state.errorMessage));
        }else{
          return Skeletonizer(child: OrdersViewBody(orders: [
            getDummyOrderData(),
            getDummyOrderData(),

          ]));

        }
        },
    );
  }
}
