import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void updateEmail(String input) {
    emailController.text=input;
    validateEmailForm();
    notifyListeners();
  }
  void validateEmailForm(){
    bool isEmailValid=validateEmail(emailController.text)==null;
    if(isEmailValid){
      isButtonEnabled=true;
    }else{
      isButtonEnabled = false;
    }
    notifyListeners();
  }

  void updatePassword(String input) {
    passwordController.text=input;
    validatePasswordForm();
    notifyListeners();
  }

  void updateConfirmPassword(String input) {
    confirmPasswordController.text=input;
    validatePasswordForm();
    notifyListeners();
  }


  void validatePasswordForm() {
    bool isPasswordValid = validatePassword(passwordController.text) == null;
    bool isConfirmPasswordValid = validateConfirmPassword(confirmPasswordController.text) == null;

    if (isPasswordValid && isConfirmPasswordValid) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
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

  String? validateConfirmPassword(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please re-enter your password';
    if (input != passwordController.text) return 'Passwords do not match';
    return null;
  }
}
