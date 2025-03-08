import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/widgets/custom_card.dart';

import '../../../../core/constant/Custom_AppBar.dart';
import 'language_page.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressAppbar: () {
          // إضافة الكود الخاص بك هنا
        },
        titleAppbar: 'Survey',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              child: ListView(
                children: [
                  SubjectCard(
                    subject: 'Language',
                    icon: Icons.language,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguagePage(subject: 'Language'),
                        ),
                      );
                    },
                  ),
                  SubjectCard(subject: 'Math', icon: Icons.calculate, onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguagePage(subject: 'Math'),
                      ),
                    );
                  },),
                  SubjectCard(subject: 'Art', icon: Icons.palette, onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguagePage(subject: 'Art'),
                      ),
                    );
                  },),
                  SubjectCard(subject: 'Science', icon: Icons.science, onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguagePage(subject: 'Science'),
                      ),
                    );
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
