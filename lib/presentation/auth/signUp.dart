import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';

import '../../core/constant/Custom_AppBar.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(titleAppbar: 'SignUp'),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 15,
            children: [
              CustomTextFormField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'plz,enter your user name';
                    }
                    return null;
                  },
                  controller: userNameController,
                  hintText: 'User Name',
                  labelText: 'Enter your user name'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Name is required';
                          }
                          if (!RegExp(r"^[a-zA-Z\s-]{2,50}$").hasMatch(input)) {
                            return 'Name must be between 2 and 50 characters';
                          }
                          return null;
                        },
                        controller: firstNameController,
                        hintText: 'Enter first name',
                        labelText: 'First Name'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Name is required';
                          }
                          if (!RegExp(r"^[a-zA-Z\s-]{2,50}$").hasMatch(input)) {
                            return 'Name must be between 2 and 50 characters';
                          }
                          return null;
                        },
                        controller: lastNameController,
                        hintText: 'Enter last name',
                        labelText: 'Last Name'),
                  ),
                ],
              ),
              CustomTextFormField(
                hintText: 'Enter your email',
                labelText: 'User Name',
                controller: emailEditingController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please, enter your email';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'plz,enter your password';
                          }
                          if (input.length < 8) {
                            return 'your password should be at least 8 chars';
                          }
                          return null;
                        },
                        controller: passwordController,
                        isSecure: true,
                        hintText: 'Enter your password',
                        labelText: 'Password'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'plz,enter your re-password';
                          }
                          if (input.length < 8) {
                            return 'your re-password should be at least 8 chars';
                          }
                          return null;
                        },
                        controller: confirmPasswordController,
                        isSecure: true,
                        hintText: 'Enter your re-password',
                        labelText: 'Confirm Password'),
                  ),
                ],
              ),
              CustomTextFormField(
                  validator: (String? input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Phone number is required';
                    }
                    if (!RegExp(r"^(?:\+?[0-9]{1,3})?[0-9]{8,15}$")
                        .hasMatch(input)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                  controller: phoneNumberController,
                  hintText: 'Enter phone number',
                  labelText: 'Phone Number'),
              CustomMainButton(text: 'SignUp'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have account',
                    style:  TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(
                        //     context, RoutesManager.loginRoute);
                      },
                      child:  Text(
                        'SignIn',
                        style:  TextStyle(
                            color: Color(0xff02369C),
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
