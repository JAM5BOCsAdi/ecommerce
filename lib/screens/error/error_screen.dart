// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:ecommerce/providers/connectivity_provider.dart';
// import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorTitle;
  final String errorDescription;
  const ErrorScreen({
    super.key,
    required this.errorTitle,
    required this.errorDescription,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: AutoSizeText(errorTitle)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                errorDescription,
                minFontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
