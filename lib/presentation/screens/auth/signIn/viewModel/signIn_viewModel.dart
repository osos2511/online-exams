import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import '../../../../../data/model/general_response/GeneralResponse.dart';

class SignInViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  GeneralResponse? generalResponse;
  String? token;

  Future<void> signIn(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    var result = await ApiManager.signIn(email, password);

    switch (result) {
      case Success<GeneralResponse>():
        generalResponse = result.data;
        token = await ApiManager.getToken();
        isLoading = false;
        notifyListeners();
        break;

      case ServerError<GeneralResponse>():
        errorMessage = result.message;
        isLoading = false;
        notifyListeners();
        break;

      case Error<GeneralResponse>():
        errorMessage = result.exception.toString();
        isLoading = false;
        notifyListeners();
        break;
    }
  }
}