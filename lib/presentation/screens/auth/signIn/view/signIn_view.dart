import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/Custom_AppBar.dart';
import '../../../../../core/constant/Custom_Main_Button.dart';
import '../../../../../core/constant/Custom_TextForm_Field.dart';
import '../../../../../core/routes_manager.dart';
import '../../../../../provider/auth_provider/signIn_provider.dart';
import '../viewModel/signIn_viewModel.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
      ],
      child: Consumer2<SignInProvider, SignInViewModel>(
        builder: (context, signInProvider, signInVm, child) {
          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Sign In'),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.08),
                      CustomTextFormField(
                        controller: signInProvider.emailController,
                        onChanged: signInProvider.updateSignInEmail,
                        validator: signInProvider.validateEmail,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        controller: signInProvider.passwordController,
                        onChanged: signInProvider.updateSignInPassword,
                        validator: signInProvider.validatePassword,
                        isSecure: true,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: signInProvider.isRememberMeChecked, // استخدم القيمة المحدثة
                            onChanged: (bool? value) {
                              signInProvider.toggleRememberMe(value);
                            },
                          ),
                          Text('Remember me'),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesManager.forgetPasswordRoute);
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      signInVm.isLoading
                          ? const CircularProgressIndicator()
                          : CustomMainButton(
                              isButtonEnabled: signInProvider.isButtonEnabled,
                              text: 'Sign In',
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  await signInVm.signIn(signInProvider.emailController.text,signInProvider.passwordController.text);
                                  if (signInVm.errorMessage == null) {
                                    Navigator.pushReplacementNamed(context,
                                        RoutesManager.editProfileRoute);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(signInVm.errorMessage!),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              }),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
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
            ),
          );
        },
      ),
    );
  }
}
