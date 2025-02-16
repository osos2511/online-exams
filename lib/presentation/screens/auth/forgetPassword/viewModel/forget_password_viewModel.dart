import 'package:flutter/foundation.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/password_response/ForgetPasswordResponse.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  ForgetPasswordResponse? forgetPasswordResponse;

  Future<void> forgetPassword(String email) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    print("🔍 Sending Request: Email=$email");

    var result = await ApiManager.forgetPassword(email);

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
