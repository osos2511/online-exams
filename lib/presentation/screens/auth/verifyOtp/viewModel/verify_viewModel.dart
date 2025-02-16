import 'package:flutter/foundation.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/password_response/ForgetPasswordResponse.dart';

class VerifyViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  ForgetPasswordResponse? forgetPasswordResponse;

  Future<void> verifyOtp(String verifyCode) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    print("🔍 Sending Request: Email=$verifyCode");

    var result = await ApiManager.verifyOtpPassword(verifyCode);

    switch (result) {
      case Success<ForgetPasswordResponse>():
        forgetPasswordResponse = result.data;
        isLoading = false;
        notifyListeners();
        break;

      case ServerError<ForgetPasswordResponse>():
        errorMessage = result.message;
        isLoading = false;
        notifyListeners();
        break;

      case Error<ForgetPasswordResponse>():
        errorMessage = result.exception.toString();
        isLoading = false;
        notifyListeners();
        break;
    }
  }
}
