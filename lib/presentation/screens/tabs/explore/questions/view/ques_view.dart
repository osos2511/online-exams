import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../results/Exam_Score.dart';
import '../viewModel/ques_viewModel.dart';

class QuesView extends StatelessWidget {
  final int duration;
  final String examId;

  const QuesView({required this.duration, required this.examId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuesViewModel(duration: duration)..getAllQuestions(examId),
      child: Consumer<QuesViewModel>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.questions.isEmpty) {
            return const Center(child: Text("No questions available."));
          }

          var currentQuestion = provider.questions[provider.currentQuestionIndex];
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;

          return Scaffold(
            appBar: AppBar(
              title: const Text("Exam"),
              actions: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Text(
                    provider.formatTime(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(value: (provider.currentQuestionIndex + 1) / provider.questions.length),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Question ${provider.currentQuestionIndex + 1} of ${provider.questions.length}",
                    style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    currentQuestion["question"],
                    style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentQuestion["options"].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                              color: Colors.grey[200],
                            ),
                            child: RadioListTile<int>(
                              title: Text(currentQuestion["options"]),
                              value: index,
                              groupValue: provider.selectedOption,
                              onChanged: (value) => provider.selectOption(value!),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: provider.currentQuestionIndex > 0 ? provider.previousQuestion : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.blue),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: Text("Back", style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04)),
                      ),
                      ElevatedButton(
                        onPressed: provider.selectedOption != null ? () {
                          if (provider.currentQuestionIndex < provider.questions.length - 1) {
                            provider.nextQuestion();
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamScoreScreen(
                                  scorePercentage: provider.scorePercentage,
                                  correctAnswers: provider.correctAnswers,
                                  incorrectAnswers: provider.questions.length - provider.correctAnswers,
                                ),
                              ),
                            );
                          }
                        } : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: Text(
                          provider.currentQuestionIndex < provider.questions.length - 1 ? "Next" : "Finish",
                          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
