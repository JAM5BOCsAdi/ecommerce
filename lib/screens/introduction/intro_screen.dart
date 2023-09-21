import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    final _introKey = GlobalKey<IntroductionScreenState>();
    final _introProvider = Provider.of<IntroProvider>(context);

    Image _buildFullScreenImage(String path) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );
    }

    PageDecoration _pageDecoration() {
      return PageDecoration(
        imageFlex: 2,
        bodyFlex: 1,
        imageAlignment: Alignment.center,
        bodyAlignment: Alignment.topCenter,
        imagePadding: EdgeInsets.only(
          top: _screen.height * 0.05,
          left: _screen.width * 0.025,
          right: _screen.width * 0.025,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(
        child: IntroductionScreen(
          key: _introKey,
          initialPage: 0,
          next: const Icon(Icons.arrow_forward),
          isProgress: true,
          skip: const AutoSizeText(skip),
          onSkip: () {
            _introKey.currentState?.skipToEnd();
          },
          done: const AutoSizeText(done),
          onDone: () {
            _introProvider.prefs.setBool('isFresher', false);

            context.router.replaceNamed(signInScreen);
          },
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            size: Size(_screen.width * 0.025, _screen.height * 0.015),
            activeSize: Size(_screen.width * 0.055, _screen.height * 0.015),
            activeShape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(_screen.width * 0.025)),
            ),
          ),
          pages: [
            PageViewModel(
              title: PVMT1,
              body: PVMB1,
              image: _buildFullScreenImage(introImg1),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              title: PVMT2,
              body: PVMB2,
              image: _buildFullScreenImage(introImg2),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              title: PVMT3,
              body: PVMB3,
              image: _buildFullScreenImage(introImg3),
              decoration: _pageDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
