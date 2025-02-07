import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    required this.controller,
    this.suffixIcon,
    this.isObscure = false,
    this.numberOfLines,
  });

  final String hintText;
  final Widget? prefixIcon;
  final Validator? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  final bool isObscure;
  final int? numberOfLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines: numberOfLines,
      //minLines: numberOfLines,
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
