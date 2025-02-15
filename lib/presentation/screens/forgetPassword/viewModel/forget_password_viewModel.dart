import 'package:flutter/foundation.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/password_response/ForgetPasswordResponse.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  ForgetPasswordResponse? forgetPasswordResponse;

  Future<void> forgetPassword({required String email, String? verifyCode}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    print("🔍 Sending Request: Email=$email, VerifyCode=$verifyCode");

    var result = await ApiManager.forgetPassword(email: email, verifyCode: verifyCode);

    switch (result) {
      case Success<ForgetPasswordResponse>():
        forgetPasswordResponse = result.data;
        isLoading = false;
        notifyListeners();
        print("✅ Success: ${forgetPasswordResponse?.resetCode}");
        break;

      case ServerError<ForgetPasswordResponse>():
        errorMessage = result.message;
        isLoading = false;
        notifyListeners();
        print("❌ Server Error: $errorMessage");
        break;

      case Error<ForgetPasswordResponse>():
        errorMessage = result.exception.toString();
        isLoading = false;
        notifyListeners();
        print("❌ Error: $errorMessage");
        break;
    }
  }
}
