import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/git_it_services.dart';
import 'package:fruits_hub_dashboard/simple_block_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'features/dashboard_view/presentation/views/dash_board_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://rvqrzdgspuvitpzogehe.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ2cXJ6ZGdzcHV2aXRwem9nZWhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEwNjQ5MTksImV4cCI6MjA3NjY0MDkxOX0.Z7GGqEKY8Jrya83ogcukbOMav7k06chvdLz95ZWfX6Y',
  );
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
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
