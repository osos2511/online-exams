import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key, required this.text, this.onPress, this.isButtonEnabled=false});

  final String text;
  final void Function()? onPress;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isButtonEnabled?  Color(0xff02369C):Colors.grey,
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed:onPress,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      ),
    );
  }
}
