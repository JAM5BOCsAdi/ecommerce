import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _introKey = GlobalKey<IntroductionScreenState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('First Screen')),
      ),
      body: SafeArea(
        child: IntroductionScreen(
          // key: _introKey,
          done: SizedBox(),
          pages: [
            PageViewModel(
              title: 'First',
              body: 'First Body',
            ),
            PageViewModel(
              title: 'Second',
              body: 'Second Body',
            ),
            PageViewModel(
              title: 'Third',
              body: 'Third Body',
            ),
          ],
          next: const Icon(Icons.arrow_forward),
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          onDone: () {},
          onChange: (index) {},
        ),
      ),
    );
  }
}
