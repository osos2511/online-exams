import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/presentation/screens/tabs/profile/widgets/image%20picker/custom_image_picker%20.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes_manager.dart';
import '../../../../provider/profile_provider/edit_profile_provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => EditProfileProvider(),
      child: Consumer<EditProfileProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Profile'),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,vertical: screenHeight*0.04),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const ProfileImage(),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextFormField(
                      onChanged: provider.updateUserName,
                      validator: provider.validateUserName,
                      controller: provider.userNameController,
                      hintText: 'User Name',
                      labelText: 'Enter your user name',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            validator: provider.validateFirstName,
                            onChanged: provider.updateFirstName,
                            controller: provider.firstNameController,
                            hintText: 'Enter first name',
                            labelText: 'First Name',
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: CustomTextFormField(
                            validator: provider.validateLastName,
                            controller: provider.lastNameController,
                            onChanged: provider.updateLastName,
                            hintText: 'Enter last name',
                            labelText: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      controller: provider.emailController,
                      validator: provider.validateEmail,
                      onChanged: provider.updateEmail,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: provider.validatePassword,
                      onChanged: provider.updatePassword,
                      controller: provider.passwordController,
                      isSecure: true,
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      suffixText: 'Change',
                      onSuffixTap: () {
                        print("Change password tapped!");
                        // Add navigation or action here
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: provider.validatePhoneNumber,
                      onChanged: provider.updatePhoneNumber,
                      controller: provider.phoneNumberController,
                      hintText: 'Enter phone number',
                      labelText: 'Phone Number',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomMainButton(
                      isButtonEnabled: provider.isButtonEnabled,
                      text: 'Update',
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                         // provider.saveProfile();
                          Navigator.pushReplacementNamed(context, RoutesManager.signInRoute);
                        } else {
                          print("Form is invalid, please check inputs.");
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
