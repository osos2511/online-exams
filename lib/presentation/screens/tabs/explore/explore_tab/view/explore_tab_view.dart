import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constant/Custom_AppBar.dart';
import '../../language_page.dart';
import '../viewModel/explore_tab_viewModel.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreTabViewModel()..getAllSubjects(),
      child: Scaffold(
        appBar: CustomAppbar(
          onPressAppbar: () {},
          titleAppbar: 'Survey',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ExploreTabViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.errorMessage != null) {
                return Center(child: Text(viewModel.errorMessage!));
              }
              if (viewModel.response?.subjects == null || viewModel.response!.subjects!.isEmpty) {
                return const Center(child: Text("No subjects available."));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Browse by subject',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.response!.subjects!.length,
                      itemBuilder: (context, index) {
                        final subject = viewModel.response!.subjects![index];
                        return SubjectCard(
                          subject: subject.name ?? 'Unknown',
                          urlImage: subject.icon??'',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LanguagePage(subject: subject.name ?? 'Unknown'),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
