import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exams/core/constant/Custom_AppBar.dart';

import '../../../core/routes_manager.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String correctCode = "1234";
  bool isError = false;
  bool clearText = false;

  void _checkOtp(String enteredCode) {
    if (enteredCode == correctCode) {
      Navigator.pushNamed(context, RoutesManager.resetPasswordRoute);
    } else {
      setState(() {
        isError = true;
        clearText = true;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          clearText = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppbar(titleAppbar: 'Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,vertical: screenWidth * 0.02),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            const Text(
              'Email verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              'Please enter your code that was sent to your email address',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff535353)),
            ),
            SizedBox(height: screenHeight * 0.05),

            OtpTextField(
              clearText: clearText,
              fieldWidth: screenWidth * 0.2,
              fieldHeight: screenHeight * 0.1,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              numberOfFields: 4,
              focusedBorderColor: isError ? Colors.red : const Color(0xff02369C),
              borderColor: isError ? Colors.red : const Color(0xff02369C),
              enabledBorderColor: isError ? Colors.red : const Color(0xff02369C),
              disabledBorderColor: isError ? Colors.red : const Color(0xff02369C),
              showFieldAsBox: true,
              onSubmit: _checkOtp,
            ),

            SizedBox(height: screenHeight * 0.02),

            if (isError)
              Text(
                'Invalid Code. Please try again!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),

            SizedBox(height: screenHeight * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive code? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isError = false;
                      clearText = true;
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      setState(() {
                        clearText = false;
                      });
                    });
                  },
                  child: Text(
                    'Send again',
                    style: TextStyle(
                      color: const Color(0xff02369C),
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xff02369C),
                    ),
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
