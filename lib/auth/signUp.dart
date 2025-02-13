import 'package:flutter/material.dart';
import 'package:online_exams/auth/widgets/Custom_TextForm_Field.dart';

import '../core/Custom_AppBar.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(titleAppbar: 'SignUp'),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Enter your email',
                labelText: 'User Name',
                controller: emailEditingController,
                validator: (input) {
                  String pattern = r'^[a-zA-Z]+$';
                  RegExp regex = RegExp(pattern);
                  if (input == null || input.trim().isEmpty) {
                    return 'Please, enter your full name';
                  }
                  if (input.length < 6) {
                    return 'Your full name should be at least 6 characters';
                  }
                  if (!regex.hasMatch(input)) {
                    return 'Invalid format. Only letters allowed';
                  }
                  return null;
                },
              ),
            ],
          ),
        ));
  }
}
