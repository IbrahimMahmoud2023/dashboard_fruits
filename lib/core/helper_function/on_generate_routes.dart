import 'package:flutter/material.dart';

import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/dashboard_view/presentation/views/dash_board_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings ){
  switch (settings.name){
    case DashBoardView.routeName:
      return MaterialPageRoute(builder: (context) => DashBoardView());
      case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => OrdersView());
      case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    default :
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}