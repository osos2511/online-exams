import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/subjects_response/SubjectsResponse.dart';

class ExploreTabViewModel extends ChangeNotifier{
  SubjectsResponse?response;
  String? errorMessage;
  String? token;
  bool isLoading = false;
Future<void>getAllSubjects()async{
  isLoading=true;
  errorMessage = null;
  notifyListeners();
  var result=await ApiManager.getAllSubjects();
  switch(result){
    case Success<SubjectsResponse>():
      response=result.data;
      token=await ApiManager.getToken();
      isLoading=false;
      notifyListeners();
      break;
    case ServerError<SubjectsResponse>():
      errorMessage=result.message;
      isLoading = false;
      notifyListeners();
      break;

    case Error<SubjectsResponse>():
      errorMessage = result.exception.toString();
      isLoading = false;
      notifyListeners();
      break;
  }
}


}