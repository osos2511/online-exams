import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.signInRoute,
      onGenerateRoute: RoutesManager.router,
    );
  }
}