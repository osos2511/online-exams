import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMeChecked = false;
  bool isButtonEnabled = false;
  Color buttonColor = Color(0xff878787); // اللون الافتراضي (رمادي)

  void updateEmail(String input) {
    validateForm();
  }

  void updatePassword(String input) {
    validateForm();
  }

  void validateForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled = true;
      buttonColor = Color(0xff02369C); // ✅ يصبح أزرق عند إدخال البيانات
    } else {
      isButtonEnabled = false;
      buttonColor = Colors.black; // ❌ يبقى رمادي إذا كانت هناك بيانات ناقصة
    }
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    isRememberMeChecked = value ?? false;
    notifyListeners();
  }
}
