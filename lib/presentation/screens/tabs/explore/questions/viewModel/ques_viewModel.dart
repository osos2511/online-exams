import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:online_exams/core/constant/result.dart';
import 'package:online_exams/data/api_manager/api_manager.dart';
import 'package:online_exams/data/model/question_response/QuestionsResponse.dart';

class QuesViewModel extends ChangeNotifier {
  QuestionsResponse? response;
  String? errorMessage;
  String? token;
  bool isLoading = false;

  int currentQuestionIndex = 0;
  int? selectedOption;
  int remainingTime;
  Timer? timer;
  int correctAnswers = 0;

  List<Map<String, dynamic>> questions = [];

  QuesViewModel({required int duration}) : remainingTime = duration * 60 {
    startTimer();
  }

  Future<void> getAllQuestions(String examId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    var result = await ApiManager.getAllQuestionsOnExam(examId);
    switch (result) {
      case Success<QuestionsResponse>():
        response = result.data;
        token = await ApiManager.getToken();
        questions = response?.questions?.map((q) => {
          "question": q.question,
          "options": q.answers?.map((answer) => answer.answer ?? "").toList(),
          "correctAnswerIndex": int.tryParse(q.correct ?? "0") ?? 0,
        }).toList() ?? [];
        print("✅ Loaded Questions: $questions"); // ✅ تفقد البيانات هنا
        for (var q in questions) {
          print("🔍 Question: ${q["question"]}");
          print("🔍 Options: ${q["options"]}");
          print("🔍 Correct Answer Index: ${q["correctAnswerIndex"]}");
        }
        isLoading = false;
        break;
      case ServerError<QuestionsResponse>():
        errorMessage = result.message;
        isLoading = false;
        break;
      case Error<QuestionsResponse>():
        errorMessage = result.exception.toString();
        isLoading = false;
        break;
    }
    notifyListeners();
  }

  void selectOption(int value) {
    selectedOption = value;
    notifyListeners();
  }

  void nextQuestion() {
    if (selectedOption == questions[currentQuestionIndex]["correctAnswerIndex"]) {
      correctAnswers++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      selectedOption = null;
    } else {
      endExam();
    }
    notifyListeners();
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      selectedOption = null;
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
        endExam();
      }
    });
  }

  String formatTime() {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  double get scorePercentage => (correctAnswers / questions.length) * 100;

  void endExam() {
    timer?.cancel();
    notifyListeners();
  }
}