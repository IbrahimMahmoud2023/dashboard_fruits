import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard_view/presentation/views/widgets/dash_board_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});
static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardViewBody(),
    );
  }
}
