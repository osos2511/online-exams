import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/exams/viewModel/exams_viewModel.dart';
import 'package:provider/provider.dart';
import '../../exam/view/exam_view.dart';
import '../../widgets/custom_exam_card.dart';

class ExamsView extends StatelessWidget {
  final String subjectId;
  final String subjectName;

  const ExamsView({super.key, required this.subjectId, required this.subjectName});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ExamsViewModel()..getAllExamsOnSubject(subjectId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('$subjectName', style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ExamsViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.errorMessage != null) {
                return Center(child: Text(viewModel.errorMessage!));
              }
              if (viewModel.response?.exams == null || viewModel.response!.exams!.isEmpty) {
                return const Center(child: Text("No exams available."));
              }
              return ListView.builder(
                itemCount: viewModel.response?.exams?.length ?? 0,
                itemBuilder: (context, index) {
                  final exam = viewModel.response!.exams![index];
                  return ExamCard(
                    title:exam.title,
                    numOfQuestion: exam.numberOfQuestions,
                    quizDuration: exam.duration,
                    onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamView(examId: exam.id ?? '',),
                      ),
                    );
                  },
                  );
                },
              );
            },

          ),
        ),
      ),
    );
  }
}
