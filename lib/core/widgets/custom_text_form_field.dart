import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    required this.controller,
    this.suffixIcon,
    this.isObscure = false,
  });

  final String hintText;
  final Widget prefixIcon;
  final Validator? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
