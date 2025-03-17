import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/exams_response/ExamsResponse.dart';

class ExamsViewModel extends ChangeNotifier{
  ExamsResponse?response;
  String? errorMessage;
  String? token;
  bool isLoading = false;
  Future<void>getAllExamsOnSubject(subjectId)async{
    isLoading=true;
    errorMessage = null;
    notifyListeners();
    var result=await ApiManager.getAllExamsOnSubject(subjectId);
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