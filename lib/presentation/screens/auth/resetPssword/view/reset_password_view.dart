import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/auth_provider/password_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/Custom_AppBar.dart';
import '../../../../../core/constant/Custom_Main_Button.dart';
import '../viewModel/reset_password_viewModel.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PasswordProvider()),
        ChangeNotifierProvider(create: (context) => ResetPasswordViewModel()),
      ],
      child: Consumer2<PasswordProvider, ResetPasswordViewModel>(
        builder: (context, passwordProvider, resetPasswordViewModel, child) {
          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Password'),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.05,
                    horizontal: screenWidth * 0.03,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Password must not be empty and must contain 6 characters with an uppercase letter and one number at least',
                        style: TextStyle(
                          color: Color(0xff535353),
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        validator: passwordProvider.validateEmail,
                        controller: passwordProvider.emailController,
                        onChanged: passwordProvider.updateEmailResetPass,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextFormField(
                        onChanged: passwordProvider.updatePassword,
                        validator: passwordProvider.validatePassword,
                        controller: passwordProvider.passwordController,
                        isSecure: true,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomMainButton(
                        text: resetPasswordViewModel.isLoading ? 'Loading...' : 'Continue',
                        isButtonEnabled: passwordProvider.isButtonEnabled,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            print("✅ Valid input, processing password reset...");

                            await resetPasswordViewModel.resetPassword(
                              passwordProvider.emailController.text,
                              passwordProvider.passwordController.text,
                            );

                            if (resetPasswordViewModel.errorMessage == null) {
                              print("✅ Password reset successful.");
                              Navigator.pushReplacementNamed(context, RoutesManager.signInRoute);
                            } else {
                              print("❌ Error: ${resetPasswordViewModel.errorMessage}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(resetPasswordViewModel.errorMessage!)),
                              );
                            }
                          } else {
                            print("❌ Invalid input, check errors.");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
