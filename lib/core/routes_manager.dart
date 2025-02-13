import 'package:flutter/material.dart';
import 'package:online_exams/presentation/auth/forget_password.dart';
import 'package:online_exams/presentation/auth/signIn.dart';
import 'package:online_exams/presentation/auth/signUp.dart';
import 'package:online_exams/presentation/auth/verify_otp.dart';

import '../presentation/auth/reset_password.dart';


class RoutesManager{
  static const String signUpRoute='/register';
  static const String signInRoute='/login';
  static const String forgetPasswordRoute='/forgetPass';
  static const String resetPasswordRoute='/resetPass';
  static const String verifyOtpRoute='/verifyOtp';


  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case signUpRoute:{
        return MaterialPageRoute(builder: (context) =>  SignUp(),);
      }
      case signInRoute:{
        return MaterialPageRoute(builder: (context) =>  SignIn(),);
      }
      case forgetPasswordRoute:{
        return MaterialPageRoute(builder: (context) =>  ForgetPassword(),);
      }
      case resetPasswordRoute:{
        return MaterialPageRoute(builder: (context) =>  ResetPassword(),);
      } case verifyOtpRoute:{
        return MaterialPageRoute(builder: (context) =>  VerifyOtp(),);
      }

    }
    return null;
  }
}