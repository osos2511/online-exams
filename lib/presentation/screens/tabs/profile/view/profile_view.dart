import 'package:flutter/material.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';
import 'package:online_exams/core/constant/Custom_Main_Button.dart';
import 'package:online_exams/core/constant/Custom_TextForm_Field.dart';
import 'package:online_exams/presentation/screens/tabs/profile/widgets/image%20picker/custom_image_picker%20.dart';
import 'package:provider/provider.dart';
import '../../../../../core/routes_manager.dart';
import '../../../../../provider/profile_provider/edit_profile_provider.dart';
import '../viewModel/profile_viewModel.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
      ],
      child: Consumer2<EditProfileProvider, ProfileViewModel>(
        builder: (context, editProvider, profileProvider, child) {
          if (profileProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (profileProvider.errorMessage != null) {
            return Center(child: Text(profileProvider.errorMessage!));
          }

          return Scaffold(
            appBar: const CustomAppbar(titleAppbar: 'Profile'),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: screenHeight * 0.04),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const ProfileImage(),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextFormField(
                      onChanged: editProvider.updateUserName,
                      validator: editProvider.validateUserName,
                      controller: editProvider.userNameController,
                      hintText: 'User Name',
                      labelText: 'Enter your user name',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            validator: editProvider.validateFirstName,
                            onChanged: editProvider.updateFirstName,
                            controller: editProvider.firstNameController,
                            hintText: 'Enter first name',
                            labelText: 'First Name',
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: CustomTextFormField(
                            validator: editProvider.validateLastName,
                            controller: editProvider.lastNameController,
                            onChanged: editProvider.updateLastName,
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
                      controller: editProvider.emailController,
                      validator: editProvider.validateEmail,
                      onChanged: editProvider.updateEmail,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: editProvider.validatePassword,
                      onChanged: editProvider.updatePassword,
                      controller: editProvider.passwordController,
                      isSecure: true,
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      suffixText: 'Change',
                      onSuffixTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.updatePasswordRoute);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      validator: editProvider.validatePhoneNumber,
                      onChanged: editProvider.updatePhoneNumber,
                      controller: editProvider.phoneNumberController,
                      hintText: 'Enter phone number',
                      labelText: 'Phone Number',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomMainButton(
                      isButtonEnabled: editProvider.isButtonEnabled,
                      text: 'Update',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          // يتم استدعاء getProfileInfo هنا بدون الحاجة للتوكن
                          await profileProvider.getProfileInfo();
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.signInRoute);
                        } else {
                          print("Form is invalid, please check inputs.");
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
