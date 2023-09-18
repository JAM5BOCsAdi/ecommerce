import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/providers/scroll_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.075,
            left: screenWidth * 0.025,
            right: screenWidth * 0.025,
          ),
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            height: screenHeight,
            width: screenWidth,
            child: Scrollbar(
              child: SingleChildScrollView(
                controller: scrollProvider.scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
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
                      obscuringCharacter: '*',
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.025,
                        right: screenWidth * 0.025,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            screenWidth,
                            screenHeight * 0.075,
                          ),
                        ),
                        child: const AutoSizeText(
                          'Sign In',
                          minFontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText('Don\'t have an account yet?'),
                        TextButton(
                          onPressed: () {
                            context.router.replaceNamed('/sign_up_screen');
                          },
                          child: const AutoSizeText(
                            'Register here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
