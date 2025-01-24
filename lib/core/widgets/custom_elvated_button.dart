import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPress, required this.buttonText});

  final VoidCallback onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(buttonText));
  }
}
