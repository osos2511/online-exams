import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMeChecked = false;
  bool isButtonEnabled = false;

  void updateSignInEmail(String input) {
    emailController.text=input;
    validateSignInForm();
    notifyListeners();
  }

  void updateSignInPassword(String input) {
    passwordController.text=input;
    validateSignInForm();
    notifyListeners();
  }

  void validateSignInForm() {
    bool isEmailValid = validateEmail(emailController.text) == null;
    bool isPasswordValid = validatePassword(passwordController.text) == null;

    if (isEmailValid && isPasswordValid) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    isRememberMeChecked = value ?? false;
    notifyListeners();
  }

  String? validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your email';
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(input)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your password';
    if (input.length < 8) return 'Password should be at least 8 characters';
    return null;
  }
}
