import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: AutoSizeText(text),
    ),
  );
}
