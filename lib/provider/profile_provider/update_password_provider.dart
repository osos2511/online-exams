import 'package:flutter/cupertino.dart';
import 'package:online_exams/provider/auth_provider/password_provider.dart';

class UpdatePasswordProvider extends PasswordProvider {
  final TextEditingController currentPasswordController = TextEditingController();

  void updateCurrentPassword(String input) {
    currentPasswordController.text = input;
    validateResetPasswordForm();
    notifyListeners();
  }


  String? validateCurrentPassword(String? input) {
    if (input == null || input.trim().isEmpty) return 'Please enter your current password';

    // 🔹 هنا يمكنك التحقق من تطابق كلمة المرور الحالية مع كلمة المرور الفعلية في قاعدة البيانات
    // مثال:
    // if (input != storedCurrentPassword) {
    //   return 'Current password is incorrect';
    // }

    return null;
  }

  /// ✅ التحقق من جميع الحقول (بما في ذلك كلمة المرور الحالية)
  @override
  void validateResetPasswordForm() {
    bool isCurrentPasswordValid = validateCurrentPassword(currentPasswordController.text) == null;
    bool isPasswordValid = validatePassword(passwordController.text) == null;
    bool isConfirmPasswordValid = validateConfirmPassword(confirmPasswordController.text) == null;

    if (isCurrentPasswordValid && isPasswordValid && isConfirmPasswordValid) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    notifyListeners();
  }

  @override
  void updateEmail(String input) {}

  @override
  String? validateEmail(String? input) {
    return null;
  }
}
