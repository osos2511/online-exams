import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key,required this.title,required this.numOfQuestion,required this.quizDuration,required this.onPress,});
final String? title;
final num? numOfQuestion;
final num? quizDuration;
  final VoidCallback onPress;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPress,
      child: SizedBox(
        height: 120,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/languageImg.png', width: 50, height: 60),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        title??'',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),

                      Text('Questions: ${numOfQuestion?.toString() ?? "N/A"}'),
                    ],
                  ),
                ),
                 Text(
                   '${quizDuration?.toString() ?? "0"} min',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
