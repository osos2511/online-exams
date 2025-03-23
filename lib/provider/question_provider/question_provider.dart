import 'dart:async';
import 'package:flutter/foundation.dart';

class QuestionProvider extends ChangeNotifier {
  int currentQuestionIndex = 0;
  int? selectedOption;
  late int remainingTime;
  Timer? timer;
  int correctAnswers = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Select the correctly punctuated sentence.",
      "options": ["Its going to rain today.", "It's going to rain today.", "Its going to rain today.", "It's going to rain today."],
      "correctAnswerIndex": 1
    },
    {
      "question": "Which word is a noun?",
      "options": ["Run", "Beautiful", "Dog", "Quickly"],
      "correctAnswerIndex": 2
    },
    {
      "question": "What is the capital of France?",
      "options": ["London", "Berlin", "Madrid", "Paris"],
      "correctAnswerIndex": 3
    },
  ];

  QuestionProvider({required int duration}) : remainingTime = duration * 60 {
    startTimer();
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
      notifyListeners();
    } else {
      endExam();
    }
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
