import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_exams/core/constant/endPoints.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/model/password_response/ForgetPasswordResponse.dart';
import '../model/general_response/GeneralResponse.dart';
import '../model/general_response/User.dart';


class ApiManager {
  static Future<Result<GeneralResponse>> signUp(User user) async {
    final url = Uri.parse(EndPoints.signUpEndPoint);
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(user.toJson()),
      );
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      final parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data: GeneralResponse.fromJson(parsedJson));
      } else {
        return ServerError(
          message: parsedJson["message"] ?? "Sign-up failed",
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      return Error(exception: Exception("Request failed: ${e.toString()}"));
    }
  }

  static Future<Result<GeneralResponse>> signIn(String email,String password)async{
    final uri=Uri.parse(EndPoints.signInEndPoint);
    try {
      final response = await http.post(
          uri,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"},
          body: jsonEncode(
            {
              'email':email,
              'password':password
            }
          ),
      );
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      final parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data: GeneralResponse.fromJson(parsedJson));
      } else {
        return ServerError(
          message: parsedJson["message"] ?? "Sign-in failed",
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      return Error(exception: Exception("Request failed: ${e.toString()}"));
    }
  }

  static Future<Result<ForgetPasswordResponse>> forgetPassword(String email) async {
    final url = Uri.parse(EndPoints.forgetPasswordEndPoint);


    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({'email': email}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      final parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data: ForgetPasswordResponse.fromJson(parsedJson));
      } else {
        return ServerError(
          message: parsedJson["message"] ?? "Failed process",
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      return Error(exception: Exception("Request failed: ${e.toString()}"));
    }
  }

  static Future<Result<ForgetPasswordResponse>>verifyOtpPassword(String verifyOtp) async {
    final url = Uri.parse(EndPoints.verifyOtpEndPoint);

    print("ResetCode=$verifyOtp");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({'resetCode': verifyOtp}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      final parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data: ForgetPasswordResponse.fromJson(parsedJson));
      } else {
        return ServerError(
          message: parsedJson["message"] ?? "Failed process",
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      return Error(exception: Exception("Request failed: ${e.toString()}"));
    }
  }


  static Future<Result<ForgetPasswordResponse>>resetPassword(String email,String newPassword) async {
    final url = Uri.parse(EndPoints.resetPasswordEndPoint);

    print("email=$email newPass=$newPassword");

    try {
      final response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({'email': email,'newPassword':newPassword}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      final parsedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data: ForgetPasswordResponse.fromJson(parsedJson));
      } else {
        return ServerError(
          message: parsedJson["message"] ?? "Failed process",
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      return Error(exception: Exception("Request failed: ${e.toString()}"));
    }
  }



}

