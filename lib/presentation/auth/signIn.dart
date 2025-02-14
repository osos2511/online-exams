import 'package:flutter/material.dart';
import 'package:online_exams/presentation/auth/widgets/Custom_TextForm_Field.dart';
import '../../core/constant/Custom_AppBar.dart';
import '../../core/constant/Custom_Main_Button.dart';
import '../../core/routes_manager.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppbar(titleAppbar: 'Sign In'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.08),
              CustomTextFormField(
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(input)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                controller: emailEditingController,
                hintText: 'Enter your email',
                labelText: 'Email',
              ),

              SizedBox(height: screenHeight * 0.02),

              CustomTextFormField(
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (input.length < 8) {
                    return 'Password should be at least 8 characters';
                  }
                  return null;
                },
                controller: passwordEditingController,
                hintText: 'Enter your password',
                labelText: 'Password',
                isSecure: true,
              ),

              SizedBox(height: screenHeight * 0.02),

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
                  Text('Remember me', style: TextStyle(fontSize: screenWidth * 0.04)),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.forgetPasswordRoute);

                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              CustomMainButton(
                text: 'Sign In',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    print("✅ Form is valid, proceed with sign-in.");
                  } else {
                    print("❌ Form is invalid, please check inputs.");
                  }
                },
              ),

              SizedBox(height: screenHeight * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.signUpRoute,
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff02369C),
                        fontSize: screenWidth * 0.045,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
