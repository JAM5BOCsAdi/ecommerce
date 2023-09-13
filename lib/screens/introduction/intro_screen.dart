import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _introKey = GlobalKey<IntroductionScreenState>();

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
          top: screenHeight * 0.05,
          left: screenWidth * 0.025,
          right: screenWidth * 0.025,
        ),
      );
    }

    return Consumer<IntroProvider>(
      builder: (context, introProvider, child) {
        if (introProvider.isLoading ?? false) {
          return const Center(child: CircularProgressIndicator());
        } else {
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
                skip: const AutoSizeText('Skip'),
                onSkip: () {
                  _introKey.currentState?.skipToEnd();
                },
                done: const AutoSizeText('Done'),
                onDone: () {
                  context.router.pushNamed('/login_screen');
                },
                showSkipButton: true,
                dotsDecorator: DotsDecorator(
                  size: Size(screenWidth * 0.025, screenHeight * 0.015),
                  activeSize: Size(screenWidth * 0.055, screenHeight * 0.015),
                  activeShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.025)),
                  ),
                ),
                pages: [
                  PageViewModel(
                    title: 'First',
                    body: 'First Body',
                    image:
                        _buildFullScreenImage('assets/images/intro_img1.png'),
                    decoration: _pageDecoration(),
                  ),
                  PageViewModel(
                    title: 'Second',
                    body: 'Second Body',
                    image:
                        _buildFullScreenImage('assets/images/intro_img2.png'),
                    decoration: _pageDecoration(),
                  ),
                  PageViewModel(
                    title: 'Third',
                    body: 'Third Body',
                    image:
                        _buildFullScreenImage('assets/images/intro_img3.png'),
                    decoration: _pageDecoration(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
