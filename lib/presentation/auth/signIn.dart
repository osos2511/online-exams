import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constant/Custom_AppBar.dart';
import '../../core/constant/Custom_Main_Button.dart';
import '../../core/routes_manager.dart';
import '../../provider/auth_provider/signIn_provider.dart';
import 'widgets/Custom_TextForm_Field.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: Consumer<SignInProvider>(
        builder: (context, provider, child) {
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;
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
                      validator: provider.validateEmail,
                      controller: provider.emailController,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      onChanged: provider.updateSignInEmail,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: provider.validatePassword,
                      controller: provider.passwordController,
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      isSecure: true,
                      onChanged: provider.updateSignInPassword,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Checkbox(
                          value: provider.isRememberMeChecked,
                          onChanged: provider.toggleRememberMe,
                        ),
                        Text('Remember me',
                            style: TextStyle(fontSize: screenWidth * 0.04)),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RoutesManager.forgetPasswordRoute),
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
                      isButtonEnabled: provider.isButtonEnabled,
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
                        Text("Don't have an account?",
                            style: TextStyle(fontSize: screenWidth * 0.04)),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, RoutesManager.signUpRoute),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: const Color(0xff02369C),
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
        },
      ),
    );
  }
}
