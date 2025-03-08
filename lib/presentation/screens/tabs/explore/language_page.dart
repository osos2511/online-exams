import 'package:flutter/material.dart';
import 'package:online_exams/presentation/screens/tabs/explore/widgets/custom_language_card.dart';
import 'package:online_exams/presentation/screens/tabs/explore/widgets/custom_section_title.dart';

class LanguagePage extends StatelessWidget {
  final String subject;

  const LanguagePage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subject', style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (subject == 'Language') ...[
              const SectionTitle(title: 'English'),
              const LanguageCard(),
              const LanguageCard(),
              const LanguageCard(),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Spanish'),
              const LanguageCard(),
              const LanguageCard(),
            ],
            // يمكنك إضافة المزيد من الأقسام حسب التصنيف
            if (subject == 'Math') ...[
              const SectionTitle(title: 'Algebra'),
              const LanguageCard(),
              const LanguageCard(),
            ],
          ],
        ),
      ),
    );
  }
}
