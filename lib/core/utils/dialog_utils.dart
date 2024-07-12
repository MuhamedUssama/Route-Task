import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String? title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 12),
              Text(title ?? 'Loading...'),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context, {
    required String contentMessage,
    String? title,
    String? posActionName,
    VoidCallback? posActionFunction,
    String? negActionName,
    VoidCallback? negActionFunction,
  }) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionFunction?.call();
          },
          child: Text(posActionName),
        ),
      );
    }

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionFunction?.call();
          },
          child: Text(negActionName),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ''),
          content: Text(contentMessage),
          actions: actions,
        );
      },
    );
  }
}
