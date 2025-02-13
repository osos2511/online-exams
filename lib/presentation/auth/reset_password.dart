import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';

import '../../core/constant/Custom_AppBar.dart';
import '../../core/constant/Custom_Main_Button.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppbar(
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
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (input.length < 8) {
                      return 'Password should be at least 8 characters';
                    }
                    return null;
                  },
                  controller: passwordController,
                  isSecure: true,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFormField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (input != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  isSecure: true,
                  hintText: 'Re-enter your password',
                  labelText: 'Confirm Password',
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomMainButton(
                  text: 'Continue',
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
  }
}
