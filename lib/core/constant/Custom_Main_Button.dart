import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key,required this.text,this.onPress,this.color});
final String text;
final void Function()? onPress;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor:color,minimumSize: Size(double.infinity, 50)),
        onPressed: onPress,
        child: Text(text,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),));
  }
}
