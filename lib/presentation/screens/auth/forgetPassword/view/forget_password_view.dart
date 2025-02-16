import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';
import 'package:online_exams/core/routes_manager.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/auth_provider/password_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/Custom_Main_Button.dart';
import '../viewModel/forget_password_viewModel.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
      ],
      child: Consumer2<PasswordProvider, ForgetPasswordViewModel>(
        builder: (context, passwordProvider, forgetPasswordVm, child) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            appBar: CustomAppbar(
              titleAppbar: 'Password',
              iconAppbar: Icons.arrow_back_ios,
              onPressAppbar: () {
                Navigator.pop(context);
              },
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.06,
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      onChanged: passwordProvider.updateEmail,
                      validator: passwordProvider.validateEmail,
                      controller: passwordProvider.emailController,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    forgetPasswordVm.isLoading
                        ? const CircularProgressIndicator()
                        : CustomMainButton(
                      text: 'Continue',
                      isButtonEnabled: passwordProvider.isButtonEnabled,
                      onPress: () async {
                        String email = passwordProvider.emailController.text.trim();

                        await forgetPasswordVm.forgetPassword(email);

                        if (forgetPasswordVm.errorMessage == null) {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.verifyOtpRoute,
                          );
                        }
                      },
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
