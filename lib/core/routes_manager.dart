import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/profile/update_password.dart';
import '../presentation/screens/auth/forget_password.dart';
import '../presentation/screens/auth/reset_password.dart';
import '../presentation/screens/auth/signIn/view/signIn_view.dart';
import '../presentation/screens/auth/signUp/view/signUp_view.dart';
import '../presentation/screens/auth/verify_otp.dart';
import '../presentation/screens/tabs/profile/edit_profile.dart';


class RoutesManager{
  static const String signUpRoute='/register';
  static const String signInRoute='/login';
  static const String forgetPasswordRoute='/forgetPass';
  static const String resetPasswordRoute='/resetPass';
  static const String verifyOtpRoute='/verifyOtp';
  static const String editProfileRoute='/editProfile';
  static const String updatePasswordRoute='/updatePass';


  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case signUpRoute:{
        return MaterialPageRoute(builder: (context) =>  SignUpView(),);
      }
      case signInRoute:{
        return MaterialPageRoute(builder: (context) =>  SignInView(),);
      }
      case forgetPasswordRoute:{
        return MaterialPageRoute(builder: (context) =>  ForgetPassword(),);
      }
      case resetPasswordRoute:{
        return MaterialPageRoute(builder: (context) =>  ResetPassword(),);
      } case verifyOtpRoute:{
        return MaterialPageRoute(builder: (context) =>  const VerifyOtp(),);
      }
      case editProfileRoute:{
        return MaterialPageRoute(builder: (context) =>  EditProfile(),);
      }case updatePasswordRoute:{
        return MaterialPageRoute(builder: (context) =>   UpdatePassword(),);
      }

    }
    return null;
  }
}