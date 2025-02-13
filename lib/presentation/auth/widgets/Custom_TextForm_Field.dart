import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key,
    required this.validator,
    required this.controller,
    this.isSecure = false,
    required this.hintText,
    required this.labelText});
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isSecure;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obSecureText;

  @override
  void initState() {
    super.initState();
    _obSecureText = widget.isSecure;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obSecureText,
      decoration: InputDecoration(
        label: Text(widget.labelText),
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xff535353),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2,color: Color(0xff535353)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width:2,color: Color(0xff02369C)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        suffixIcon: widget.isSecure
            ? IconButton(
          icon: Icon(
            _obSecureText ? Icons.visibility_off : Icons.visibility,color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _obSecureText = !_obSecureText;
            });
          },
        )
            : null,
      ),
    );
  }
}
