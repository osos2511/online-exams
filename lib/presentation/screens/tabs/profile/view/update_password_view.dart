import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/provider/profile_provider/update_password_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/Custom_Main_Button.dart';
import '../../../../../core/routes_manager.dart';

class UpdatePasswordView extends StatelessWidget {
   UpdatePasswordView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => UpdatePasswordProvider(),
      child: Consumer<UpdatePasswordProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar:  CustomAppbar(
                onPressAppbar: (){
                  Navigator.pushNamed(context, RoutesManager.editProfileRoute);
                },
                iconAppbar: Icons.arrow_back,
                titleAppbar: 'Update Password'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.08),
                    CustomTextFormField(
                      validator: provider.validateCurrentPassword,
                      onChanged: provider.updateCurrentPassword,
                      controller: provider.currentPasswordController,
                      hintText: 'Enter your current password',
                      labelText: 'Current Password',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: provider.validatePassword,
                      onChanged: provider.updatePassword,
                      controller: provider.passwordController,
                      hintText: 'Enter your new password',
                      labelText: 'New Password',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: provider.validateConfirmPassword,
                      onChanged: provider.updateEmailResetPass,
                      controller: provider.confirmPasswordController,
                      hintText: 'Re-enter your password',
                      labelText: 'Confirm Password',
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    CustomMainButton(
                      text: 'Continue',
                      isButtonEnabled: provider.isButtonEnabled,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          //save data here
                          Navigator.pushNamed(context, RoutesManager.editProfileRoute);
                        } else {
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
