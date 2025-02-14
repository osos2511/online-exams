import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/auth_provider/signUp_provider.dart';
import 'package:provider/provider.dart';
import '../../core/constant/Custom_AppBar.dart';
import '../../core/routes_manager.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Sign Up'),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.04),
                      CustomTextFormField(
                        onChanged: provider.updateUserName,
                        validator: provider.validateUserName,
                        controller: provider.userNameController,
                        hintText: 'User Name',
                        labelText: 'Enter your user name',
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              validator: provider.validateFirstName,
                              onChanged: provider.updateFirstName,
                              controller: provider.firstNameController,
                              hintText: 'Enter first name',
                              labelText: 'First Name',
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: CustomTextFormField(
                              validator: provider.validateLastName,
                              controller: provider.lastNameController,
                              onChanged: provider.updateLastName,
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
                        controller: provider.emailController,
                        validator: provider.validateEmail,
                        onChanged: provider.updateEmail,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              validator: provider.validatePassword,
                              onChanged: provider.updatePassword,
                              controller: provider.passwordController,
                              isSecure: true,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: CustomTextFormField(
                              validator: provider.validateConfirmPassword,
                              onChanged: provider.updateConfirmPassword,
                              controller: provider.confirmPasswordController,
                              isSecure: true,
                              hintText: 'Re-enter your password',
                              labelText: 'Confirm Password',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        validator: provider.validatePhoneNumber,
                        onChanged: provider.updatePhoneNumber,
                        controller: provider.phoneNumberController,
                        hintText: 'Enter phone number',
                        labelText: 'Phone Number',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomMainButton(
                        isButtonEnabled: provider.isButtonEnabled,
                        text: 'Sign Up',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, RoutesManager.signInRoute);
                            print("Form is valid, proceed with sign-up.");
                          } else {
                            print("Form is invalid, please check inputs.");
                          }
                        },
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
            ),
          );
        },
      ),
    );
  }
}
