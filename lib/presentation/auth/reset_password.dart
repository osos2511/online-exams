import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/auth_provider/password_provider.dart';
import 'package:provider/provider.dart';
import '../../core/constant/Custom_AppBar.dart';
import '../../core/constant/Custom_Main_Button.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => PasswordProvider(),
      child: Consumer<PasswordProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: const CustomAppbar(
              titleAppbar: 'Password',
            ),
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
                        'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
                        style: TextStyle(
                          color: Color(0xff535353),
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        validator: provider.validatePassword,
                        controller: provider.passwordController,
                        onChanged: provider.updatePassword,
                        isSecure: true,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextFormField(
                        onChanged: provider.updateConfirmPassword,
                        validator: provider.validateConfirmPassword,
                        controller: provider.confirmPasswordController,
                        isSecure: true,
                        hintText: 'Re-enter your password',
                        labelText: 'Confirm Password',
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomMainButton(
                        text: 'Continue',
                        isButtonEnabled: provider.isButtonEnabled,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            print("✅ Email is valid, proceed with password reset.");
                          } else {
                            print("❌ Invalid email, please check your input.");
                          }
                          Navigator.pushReplacementNamed(context, RoutesManager.signInRoute);
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
