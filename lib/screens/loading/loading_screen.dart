import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        height: screenHeight,
        width: screenWidth,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
