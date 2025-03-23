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
        ChangeNotifierProvider(create: (context) => ProfileViewModel()..getProfileInfo()), // تحميل البيانات عند فتح الشاشة
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

                    /// اسم المستخدم
                    CustomTextFormField(
                      controller: profileProvider.userNameController,
                      onChanged: editProvider.updateUserName,
                      validator: editProvider.validateUserName,
                      hintText: 'User Name',
                      labelText: 'Enter your user name',
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// الاسم الأول واسم العائلة
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: profileProvider.firstNameController,
                            onChanged: editProvider.updateFirstName,
                            validator: editProvider.validateFirstName,
                            hintText: 'Enter first name',
                            labelText: 'First Name',
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: CustomTextFormField(
                            controller: profileProvider.lastNameController,
                            onChanged: editProvider.updateLastName,
                            validator: editProvider.validateLastName,
                            hintText: 'Enter last name',
                            labelText: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// البريد الإلكتروني
                    CustomTextFormField(
                      controller: profileProvider.emailController,
                      onChanged: editProvider.updateEmail,
                      validator: editProvider.validateEmail,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// كلمة المرور
                    CustomTextFormField(
                      controller: editProvider.passwordController,
                      onChanged: editProvider.updatePassword,
                      validator: editProvider.validatePassword,
                      hintText: 'Enter your password',
                      isSecure: true,
                      labelText: 'Password',
                      suffixText: 'Change',
                      onSuffixTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.updatePasswordRoute);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// رقم الهاتف
                    CustomTextFormField(
                      controller: profileProvider.phoneNumberController,
                      onChanged: editProvider.updatePhoneNumber,
                      validator: editProvider.validatePhoneNumber,
                      hintText: 'Enter phone number',
                      labelText: 'Phone Number',
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    /// زر تحديث البيانات
                    CustomMainButton(
                      isButtonEnabled: editProvider.isButtonEnabled,
                      text: 'Update',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          await profileProvider.getProfileInfo(); // تحديث البيانات
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
