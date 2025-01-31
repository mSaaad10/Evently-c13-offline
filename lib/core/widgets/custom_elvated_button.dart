import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPress,
      required this.buttonText,
      this.padding});

  final VoidCallback onPress;
  final String buttonText;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(padding: padding),
        onPressed: onPress,
        child: Text(buttonText));
  }
}
