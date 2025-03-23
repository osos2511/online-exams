import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/home_screen.dart';
import 'package:online_exams/presentation/screens/tabs/explore/exam/view/exam_view.dart';
import 'package:online_exams/presentation/screens/tabs/profile/view/update_password_view.dart';
import '../presentation/screens/auth/verifyOtp/view/verify_view.dart';
import '../presentation/screens/auth/forgetPassword/view/forget_password_view.dart';
import '../presentation/screens/auth/resetPssword/view/reset_password_view.dart';
import '../presentation/screens/auth/signIn/view/signIn_view.dart';
import '../presentation/screens/auth/signUp/view/signUp_view.dart';
import '../presentation/screens/tabs/explore/exam_questions/ques_view.dart';
import '../presentation/screens/tabs/explore/exams/view/exams_view.dart';
import '../presentation/screens/tabs/profile/view/profile_view.dart';
import '../presentation/screens/tabs/results/Exam_Score.dart';

class RoutesManager {
  static const String signUpRoute = '/register';
  static const String signInRoute = '/login';
  static const String forgetPasswordRoute = '/forgetPass';
  static const String resetPasswordRoute = '/resetPass';
  static const String verifyOtpRoute = '/verifyOtp';
  static const String homeRoute = '/home';
  static const String editProfileRoute = '/editProfile';
  static const String updatePasswordRoute = '/updatePass';
  static const String examsRoute = '/exams';
  static const String examRoute = '/exam';
  static const String examQuesRoute = '/examQues';
  static const String resultRoute = '/viewResult';

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case signUpRoute:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case signInRoute:
        return MaterialPageRoute(builder: (context) => SignInView());
      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgetPasswordView());
      case resetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ResetPasswordView());
      case verifyOtpRoute:
        return MaterialPageRoute(builder: (context) => const VerifyView());
      case editProfileRoute:
        return MaterialPageRoute(builder: (context) => ProfileView());
      case updatePasswordRoute:
        return MaterialPageRoute(builder: (context) => UpdatePasswordView());
        case homeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
        case examsRoute:
        return MaterialPageRoute(builder: (context) => ExamsView(subjectId: '',subjectName: '',));
        case examRoute:
        return MaterialPageRoute(builder: (context) => ExamView(examId:''));
      case examQuesRoute:
        return MaterialPageRoute(builder: (context) => ExamQuestionsScreen(duration: 30,));
      case resultRoute:
        return MaterialPageRoute(builder: (context) =>ExamScoreScreen(scorePercentage: 80, correctAnswers: 24, incorrectAnswers: 6,));
    }

    return null;
  }
}
