import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/exams_response/ExamsResponse.dart';

class ExamViewModel extends ChangeNotifier{
  ExamsResponse?response;
  String? errorMessage;
  String? token;
  bool isLoading = false;
  Future<void>getExamById(examId)async{
    isLoading=true;
    errorMessage = null;
    notifyListeners();
    var result=await ApiManager.getExamById(examId);
    switch(result){
      case Success<ExamsResponse>():
        response=result.data;
        token=await ApiManager.getToken();
        isLoading=false;
        notifyListeners();
        break;
      case ServerError<ExamsResponse>():
        errorMessage=result.message;
        isLoading = false;
        notifyListeners();
        break;

      case Error<ExamsResponse>():
        errorMessage = result.exception.toString();
        isLoading = false;
        notifyListeners();
        break;
    }
  }


}