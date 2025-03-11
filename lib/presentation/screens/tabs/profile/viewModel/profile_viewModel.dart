import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/profile_response/ProfileResponse.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  ProfileResponse? profileResponse;

  // تعريف متحكمات النصوص الخاصة بالحقول
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> getProfileInfo() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // جلب التوكن من SharedPreferences
    String? token = await ApiManager.getToken();

    if (token == null || token.isEmpty) {
      errorMessage = "Token is missing or invalid.";
      isLoading = false;
      notifyListeners();
      return; // إيقاف العملية إذا كان التوكن مفقودًا
    }

    var result = await ApiManager.getUserInfo();

    // استخدام if للتحقق من نوع النتيجة
    if (result is Success<ProfileResponse>) {
      profileResponse = result.data;
      // تحديث المتحكمات بالقيم القادمة من الـ API فقط
      userNameController.text = profileResponse?.user?.username ?? '';
      firstNameController.text = profileResponse?.user?.firstName ?? '';
      lastNameController.text = profileResponse?.user?.lastName ?? '';
      emailController.text = profileResponse?.user?.email ?? '';
      phoneNumberController.text = profileResponse?.user?.phone ?? '';
    } else if (result is ServerError<ProfileResponse>) {
      errorMessage = result.message;
    } else if (result is Error<ProfileResponse>) {
      errorMessage = result.exception.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    // تأكد من تحرير المتحكمات عند التخلص منها
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
