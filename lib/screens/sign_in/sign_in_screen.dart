import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.025,
          right: screenWidth * 0.025,
        ),
        child: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/sign_in.svg',
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.5,
                ),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  obscure: true,
                  obscuringCharacter: '⚫',
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.025,
                    right: screenWidth * 0.025,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth, screenHeight * 0.05),
                    ),
                    child: const AutoSizeText('Sign In'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.router.pushNamed('/sign_up_screen');
                  },
                  child: const AutoSizeText(
                    'Don\'t have an account yet? Register here',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
