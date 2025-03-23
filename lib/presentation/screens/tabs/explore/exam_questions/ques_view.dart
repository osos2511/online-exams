import 'package:flutter/material.dart';
import 'dart:async';

import 'package:online_exams/core/routes_manager.dart';

import '../../results/Exam_Score.dart';

class ExamQuestionsScreen extends StatefulWidget {
  final int duration;
  ExamQuestionsScreen({required this.duration});

  @override
  _ExamQuestionsScreenState createState() => _ExamQuestionsScreenState();
}

class _ExamQuestionsScreenState extends State<ExamQuestionsScreen> {
  int? _selectedOption;
  late int _remainingTime;
  Timer? _timer;

  final List<String> options = [
    "Its going to rain today.",
    "It's going to rain today.",
    "Its going to rain today.",
    "It's going to rain today."
  ];

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration * 60; // تحويل الدقائق إلى ثوانٍ
    _startTimer();
  }



  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam"),
        actions: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              _formatTime(_remainingTime),
              style: TextStyle(
                  color: Colors.green,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LinearProgressIndicator(value: 0.05),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Question 1 of 20",
              style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              "Select the correctly punctuated sentence.",
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        color: Colors.grey[200],
                      ),
                      child: RadioListTile<int>(
                        title: Text(options[index]),
                        value: index,
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blue),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08, vertical: screenHeight * 0.015),
                  ),
                  child: Text("Back", style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08, vertical: screenHeight * 0.015),
                  ),
                  child: Text("Next", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _endExam();
      }
    });
  }

  void _endExam() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/hourglass.png', width: 80, height: 80),
              const SizedBox(height: 5),
              const Text(
                "Time out !!",
                style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff02369C),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExamScoreScreen(
                        scorePercentage: 80.0,
                        correctAnswers: 18,
                        incorrectAnswers: 2,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "View score",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

