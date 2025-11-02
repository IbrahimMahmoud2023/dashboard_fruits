import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

import '../../../../core/services/git_it_services.dart';
import '../../domain/orders_repos/orders_repo.dart';
import '../manager/fetch_order_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FetchOrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
          centerTitle: true,
        ),
        body: OrdersViewBody(),
      ),
    );
  }
}
