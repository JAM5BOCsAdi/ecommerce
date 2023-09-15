import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/screens/loading/loading_screen.dart';
import 'package:ecommerce/widgets/intro_widget.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _introKey = GlobalKey<IntroductionScreenState>();

    return Consumer<IntroProvider>(
      builder: (context, introProvider, child) {
        return FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else {
              if (introProvider.isFresher ?? true) {
                return IntroWidget(
                  introKey: _introKey,
                  introProvider: introProvider,
                );
              } else {
                return const LoginScreen();
              }
            }
          },
        );
      },
    );
  }
}
