import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'features/dashboard_view/presentation/views/dash_board_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DashBoardFruits());
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



