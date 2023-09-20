import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _screen = ScreenUtil.instance();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        height: _screen.height,
        width: _screen.width,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
