import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.validator,
    required this.controller,
    this.isSecure = false,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.suffixText,
    this.onSuffixTap,
  });

  final String? suffixText;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isSecure;
  final void Function(String)? onChanged;
  final VoidCallback? onSuffixTap; // ✅ Callback when "Change" is tapped

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
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isSecure,
      decoration: InputDecoration(
        label: Text(widget.labelText),
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff535353)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: Color(0xff535353)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xff535353)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Color(0xff02369C)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isSecure) // Show eye icon for password
              IconButton(
                icon: Icon(
                  _obSecureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obSecureText = !_obSecureText;
                  });
                },
              ),
            if (widget.suffixText != null) // Add tappable "Change" text
              GestureDetector(
                onTap: widget.onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.suffixText!,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
