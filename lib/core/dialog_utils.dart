import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context,
      {String? loadingMessage, bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Row(
            children: [
              if (loadingMessage != null) Text(loadingMessage),
              const Spacer(),
              const CircularProgressIndicator(
                backgroundColor: ColorsManager.primary,
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageDialog(BuildContext context,
      {String? title,
      String? content,
      String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction}) {
    showDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (posActionTitle != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(context);
                posAction?.call();
              },
              child: Text(posActionTitle)));
        }
        if (negActionTitle != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(context);
                negAction?.call();
              },
              child: Text(negActionTitle)));
        }

        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null ? Text(content) : null,
          actions: actions,
        );
      },
    );
  }
}
