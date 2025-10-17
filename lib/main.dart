import 'package:flutter/material.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'features/dashboard_view/presentation/views/dash_board_view.dart';

void main() {
  runApp(const DashBoardFruits());
}


class DashBoardFruits extends StatelessWidget {
  const DashBoardFruits({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashBoardView.routeName,
    );
  }
}



