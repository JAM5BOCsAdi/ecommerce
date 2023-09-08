import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: AutoSizeText('First Screen')),
      ),
      body: SafeArea(
        child: IntroductionScreen(
          initialPage: 0,
          next: const Icon(Icons.arrow_forward),
          done: const AutoSizeText('Done'),
          onDone: () {},
          showSkipButton: true,
          skip: const AutoSizeText('Skip'),
          onSkip: () {
            // print('Height: $screenHeight\nWidth: $screenWidth');
          },
          isProgress: true,
          dotsDecorator: DotsDecorator(
            // width: 10.0 px | height: 10.0 px
            size: Size(screenWidth * 0.025, screenHeight * 0.015),
            // width: 22.0 px | height: 10.0 px
            activeSize: Size(screenWidth * 0.055, screenHeight * 0.015),
            activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          // dotsContainerDecorator: const ShapeDecoration(
          //   color: Colors.amber,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //   ),
          // ),
          // key: _introKey,
          // showBackButton: false,
          // back: const Icon(Icons.arrow_back),
          // onChange: (index) {},
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
        ),
      ),
    );
  }
}
