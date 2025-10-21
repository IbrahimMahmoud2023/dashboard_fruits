import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/git_it_services.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_services.dart';
import 'package:fruits_hub_dashboard/simple_block_observer.dart';
import 'constants.dart';
import 'core/helper_function/on_generate_routes.dart';
import 'features/dashboard_view/presentation/views/dash_board_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SupabaseStorageServices.initSupabase();
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  await SupabaseStorageServices.createBucket(bucketName: kFruitImages);
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
