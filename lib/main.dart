import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:online_exams/provider/signIn_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider(),),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.signInRoute,
      onGenerateRoute: RoutesManager.router,

    );
  }
}

