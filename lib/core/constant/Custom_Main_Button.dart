import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key,required this.text,this.onPress});
final String text;
final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red,minimumSize: Size(double.infinity, 50)),
        onPressed: onPress,
        child: Text(text,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),));
  }
}
