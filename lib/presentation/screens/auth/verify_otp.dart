import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:provider/provider.dart';
import '../../../provider/auth_provider/password_provider.dart';
import '../forgetPassword/viewModel/forget_password_viewModel.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key, String? email});

  @override
  Widget build(BuildContext context) {
    // استخراج البريد الإلكتروني من arguments
    final String email = ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
      ],
      child: Consumer2<ForgetPasswordViewModel, PasswordProvider>(
        builder: (context, passwordViewModel, passwordProvider, child) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Password'),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: screenWidth * 0.02),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  const Text(
                    'Email verification',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    'Please enter your code that was sent to your email address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff535353)),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  OtpTextField(
                    fieldWidth: screenWidth * 0.12,
                    fieldHeight: screenHeight * 0.08,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    numberOfFields: 6,
                    focusedBorderColor: passwordViewModel.errorMessage != null
                        ? Colors.red
                        : const Color(0xff02369C),
                    borderColor: passwordViewModel.errorMessage != null
                        ? Colors.red
                        : const Color(0xff02369C),
                    showFieldAsBox: true,
                    onSubmit: (String enteredCode) async {
                      await passwordViewModel.forgetPassword(
                        email: email,
                        verifyCode: enteredCode,
                      );

                      if (passwordViewModel.errorMessage == null) {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.resetPasswordRoute,
                          arguments: email,
                        );
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  if (passwordViewModel.errorMessage != null)
                    Text(
                      passwordViewModel.errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Didn\'t receive code? '),
                      InkWell(
                        onTap: () {
                          passwordViewModel.errorMessage = null;
                          passwordViewModel.notifyListeners();
                        },
                        child: const Text(
                          'Send again',
                          style: TextStyle(
                            color: Color(0xff02369C),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
