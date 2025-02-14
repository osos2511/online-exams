import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.updatePasswordRoute,
      onGenerateRoute: RoutesManager.router,

    );
  }
}

