import 'package:flutter/material.dart';
import 'package:online_exams/auth/widgets/Custom_TextForm_Field.dart';
import 'package:online_exams/core/Custom_AppBar.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => SigninState();
}

class SigninState extends State<Signin> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleAppbar: 'Sign In'),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            CustomTextFormField(
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
              controller: emailEditingController,
              hintText: 'Enter your email',
              labelText: 'Email',
              isSecure: true,
            ),

            SizedBox(height: 16),

            CustomTextFormField(
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Please, confirm your password';
                }
                if (input.length < 8) {
                  return 'Confirm password should be at least 8 characters';
                }
                return null;
              },
              controller: passwordEditingController,
              hintText: 'Enter your password',
              labelText: 'Password',
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Checkbox(
                  value: isRememberMeChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isRememberMeChecked = value!;
                    });
                  },
                ),
                Text('Remember me'),
                Spacer(),
                InkWell(
                  onTap: () {

                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
