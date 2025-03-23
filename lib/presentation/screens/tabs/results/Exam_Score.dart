import 'package:flutter/material.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatelessWidget {
  final double scorePercentage;
  final int correctAnswers;
  final int incorrectAnswers;

  const ExamScoreScreen({
    super.key,
    required this.scorePercentage,
    required this.correctAnswers,
    required this.incorrectAnswers,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam score"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.04),

            // Your Score Title
            const Text(
              "Your score",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.03),

            CircularPercentIndicator(
              radius: screenWidth * 0.25,
              lineWidth: screenWidth * 0.04,
              percent: scorePercentage / 100,
              center: Text(
                "${scorePercentage.toInt()}%",
                style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
              progressColor: Colors.blue,
              backgroundColor: Colors.grey.shade300,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: screenHeight * 0.05),

            // Correct and Incorrect Answers Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _scoreDetail("Correct", correctAnswers, Colors.blue),
                SizedBox(width: screenWidth * 0.12),
                _scoreDetail("Incorrect", incorrectAnswers, Colors.red),
              ],
            ),
            SizedBox(height: screenHeight * 0.08),

            // Show Results Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff02369C),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                ),
                onPressed: () {},
                child: Text("Show results", style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white)),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Start Again Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff02369C)),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                ),
                onPressed: () {},
                child: Text("Start again", style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scoreDetail(String label, int value, Color color) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color),
        ),
        const SizedBox(width: 6),
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.transparent,
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ],
    );
  }
}
