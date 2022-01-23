import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final bool _obscureText;
  final Widget? sufixIcon;

  const GenericTextField({
    Key? key,
    this.controller,
    this.validator,
    this.sufixIcon,
    required this.labelText,
    bool obscureText = false,
  })  : _obscureText = obscureText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: _obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}
