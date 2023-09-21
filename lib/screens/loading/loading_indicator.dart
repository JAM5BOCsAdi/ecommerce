import 'package:flutter/material.dart';

Future<void> dialogShow(BuildContext context,
    {String text = 'Loading...'}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 16.0),
              Text(text),
            ],
          ),
        ),
      );
    },
  );
}

dialogDismiss(BuildContext context) {
  Navigator.of(context).pop();
}
