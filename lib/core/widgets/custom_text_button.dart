import 'package:flutter/material.dart';

typedef OnPress = void Function();

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPress, required this.textButton});

  // final VoidCallback onPress;
  final OnPress onPress;

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          textButton,
        ));
  }
}
