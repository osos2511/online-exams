import 'package:flutter/material.dart';
import 'package:online_exams/presentation/auth/signIn.dart';
import 'package:online_exams/presentation/auth/signUp.dart';


class RoutesManager{
  static const String signUpRoute='/register';
  static const String signInRoute='/login';


  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case signUpRoute:{
        return MaterialPageRoute(builder: (context) =>  SignUp(),);
      }
      case signInRoute:{
        return MaterialPageRoute(builder: (context) =>  SignIn(),);
      }

    }
    return null;
  }
}