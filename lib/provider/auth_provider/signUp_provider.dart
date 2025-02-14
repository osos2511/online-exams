import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isRememberMeChecked = false;
  bool isButtonEnabled = false;

  void updateEmail(String input) {
    emailController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updatePassword(String input) {
    passwordController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updateUserName(String input) {
    userNameController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updateFirstName(String input) {
    firstNameController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updateLastName(String input) {
    lastNameController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updateConfirmPassword(String input) {
    confirmPasswordController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void updatePhoneNumber(String input) {
    phoneNumberController.text = input;
    validateSignInForm();
    notifyListeners();
  }

  void validateSignInForm() {
    bool isEmailValid = validateEmail(emailController.text) == null;
    bool isPasswordValid = validatePassword(passwordController.text) == null;
    bool isFullNameValid = validateUserName(userNameController.text) == null;
    bool isFirstNameValid = validateFirstName(firstNameController.text) == null;
    bool isLastNameValid = validateLastName(lastNameController.text) == null;
    bool isConfirmPasswordValid = validateConfirmPassword(confirmPasswordController.text) == null;
    bool isPhoneNumberValid = validatePhoneNumber(phoneNumberController.text) == null;

    if (isEmailValid && isPasswordValid && isFullNameValid && isFirstNameValid && isLastNameValid && isConfirmPasswordValid && isPhoneNumberValid) {
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

  String? validateUserName(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your user name';
    return null;
  }

  String? validateFirstName(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your first name';
    return null;
  }

  String? validateLastName(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your last name';
    return null;
  }

  String? validateConfirmPassword(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please confirm your password';
    if (input != passwordController.text) return 'Passwords do not match';
    return null;
  }

  String? validatePhoneNumber(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your phone number';
    if (!RegExp(r'^[0-9]+$').hasMatch(input)) return 'Enter a valid phone number';
    return null;
  }
}
