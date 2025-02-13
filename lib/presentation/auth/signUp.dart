import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';

import '../../core/constant/Custom_AppBar.dart';
import '../../core/routes_manager.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppbar(titleAppbar: 'Sign Up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.04),

              CustomTextFormField(
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                controller: userNameController,
                hintText: 'User Name',
                labelText: 'Enter your user name',
              ),

              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'First name is required';
                        }
                        if (!RegExp(r"^[a-zA-Z\s-]{2,50}$").hasMatch(input)) {
                          return 'Name must be between 2 and 50 characters';
                        }
                        return null;
                      },
                      controller: firstNameController,
                      hintText: 'Enter first name',
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03), // 🎯 تناسب العرض

                  Expanded(
                    child: CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Last name is required';
                        }
                        if (!RegExp(r"^[a-zA-Z\s-]{2,50}$").hasMatch(input)) {
                          return 'Name must be between 2 and 50 characters';
                        }
                        return null;
                      },
                      controller: lastNameController,
                      hintText: 'Enter last name',
                      labelText: 'Last Name',
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              CustomTextFormField(
                hintText: 'Enter your email',
                labelText: 'Email',
                controller: emailEditingController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
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
                  ),
                  SizedBox(width: screenWidth * 0.03),

                  Expanded(
                    child: CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Please re-enter your password';
                        }
                        if (input.length < 8) {
                          return 'Confirm password should be at least 8 characters';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      isSecure: true,
                      hintText: 'Re-enter your password',
                      labelText: 'Confirm Password',
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              CustomTextFormField(
                validator: (String? input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Phone number is required';
                  }
                  if (!RegExp(r"^(?:\+?[0-9]{1,3})?[0-9]{8,15}$").hasMatch(input)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
                controller: phoneNumberController,
                hintText: 'Enter phone number',
                labelText: 'Phone Number',
              ),

              SizedBox(height: screenHeight * 0.03),

              CustomMainButton(
                text: 'Sign Up',
                onPress: () {},
              ),

              SizedBox(height: screenHeight * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.signInRoute,
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff02369C),
                        fontSize: screenWidth * 0.045,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
