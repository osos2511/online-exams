import 'package:flutter/material.dart';
import 'package:online_exams/presentation/auth/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SignUp(),
    );
  }
}

