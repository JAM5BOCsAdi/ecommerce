import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/screens/introduction/intro_widget.dart';
import 'package:ecommerce/screens/loading/loading_screen.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    _initLoading();
  }

  _initLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _showLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: (context, introProvider, child) {
        if (_showLoading) {
          return const LoadingScreen();
        } else if (introProvider.isFresher ?? true) {
          return IntroWidget(
            introKey: _introKey,
            introProvider: introProvider,
          );
        } else {
          introProvider.prefs.setBool('isFresher', false);
          return const LoginScreen();
        }
      },
    );
  }
}
