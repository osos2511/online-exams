import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/exam/viewModel/exam_viewModel.dart';
import 'package:provider/provider.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key, required  this.examId});
final String examId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExamViewModel()..getExamById(examId),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_ios),),
        ),
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),

          child: Consumer<ExamViewModel>(
            builder: (context, viewModel, child) {

              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.errorMessage != null) {
                return Center(child: Text(viewModel.errorMessage!));
              }
              if (viewModel.response?.exam == null) {
                return const Center(child: Text("No subjects available."));
              }
              final exam = viewModel.response!.exam;
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/languageImg.png', width: 50, height: 60),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exam?.title??'',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text('Questions: ${exam?.numberOfQuestions?.toString() ?? "N/A"}'),
                          ],
                        ),
                      ),
                      Text(
                        '${exam?.duration?.toString() ?? "0"} min',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff02369C),
                      minimumSize: Size(double.infinity, 60)
                    ),
                      onPressed: (){}, child: Text('Start',style: TextStyle(
                    color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500
                  ),)),
                ],
              );
            },

          ),
        ),
      ),
    );
  }
}
