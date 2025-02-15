import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/auth_provider/signUp_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/Custom_AppBar.dart';
import '../../../../../core/routes_manager.dart';
import '../../../../../data/model/general_response/User.dart';
import '../viewModel/signUp_viewModel.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
      ],
      child: Consumer2<SignUpProvider, SignInViewModel>(
        builder: (context, signUpProvider, signUpVm, child) {
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
                        controller: signUpProvider.userNameController,
                        onChanged: signUpProvider.updateUserName,
                        validator: signUpProvider.validateUserName,
                        hintText: 'User Name',
                        labelText: 'Enter your user name',
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: signUpProvider.firstNameController,
                              onChanged: signUpProvider.updateFirstName,
                              validator: signUpProvider.validateFirstName,
                              hintText: 'Enter first name',
                              labelText: 'First Name',
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: CustomTextFormField(
                              controller: signUpProvider.lastNameController,
                              onChanged: signUpProvider.updateLastName,
                              validator: signUpProvider.validateLastName,
                              hintText: 'Enter last name',
                              labelText: 'Last Name',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        controller: signUpProvider.emailController,
                        onChanged: signUpProvider.updateEmail,
                        validator: signUpProvider.validateEmail,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: signUpProvider.passwordController,
                              onChanged: signUpProvider.updatePassword,
                              validator: signUpProvider.validatePassword,
                              isSecure: true,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: CustomTextFormField(
                              controller:
                                  signUpProvider.confirmPasswordController,
                              onChanged: signUpProvider.updateConfirmPassword,
                              validator: signUpProvider.validateConfirmPassword,
                              isSecure: true,
                              hintText: 'Re-enter your password',
                              labelText: 'Confirm Password',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        controller: signUpProvider.phoneNumberController,
                        onChanged: signUpProvider.updatePhoneNumber,
                        validator: signUpProvider.validatePhoneNumber,
                        hintText: 'Enter phone number',
                        labelText: 'Phone Number',
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      signUpVm.isLoading
                          ? const CircularProgressIndicator()
                          : CustomMainButton(
                              isButtonEnabled: signUpProvider.isButtonEnabled,
                              text: 'Sign Up',
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  User newUser = User(
                                    username:
                                        signUpProvider.userNameController.text,
                                    firstName:
                                        signUpProvider.firstNameController.text,
                                    lastName:
                                        signUpProvider.lastNameController.text,
                                    email: signUpProvider.emailController.text,
                                    phone: signUpProvider
                                        .phoneNumberController.text,
                                    password:
                                        signUpProvider.passwordController.text,
                                    rePassword: signUpProvider
                                        .confirmPasswordController.text,
                                  );
                                  await signUpVm.signUp(newUser);
                                  if (signUpVm.errorMessage == null) {
                                    Navigator.pushReplacementNamed(
                                        context, RoutesManager.signInRoute);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(signUpVm.errorMessage!)),
                                    );
                                  }
                                }
                              }),
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
