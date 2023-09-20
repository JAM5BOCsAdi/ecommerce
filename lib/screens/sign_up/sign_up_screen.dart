import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = ScreenUtil.instance();
    // final emailController = useTextEditingController();
    // final passwordController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: _screen.height * 0.075,
            left: _screen.width * 0.025,
            right: _screen.width * 0.025,
          ),
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            height: _screen.height,
            width: _screen.width,
            child: Scrollbar(
              child: SingleChildScrollView(
                // controller: scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: _screen.width * 0.025,
                        right: _screen.width * 0.025,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            _screen.width,
                            _screen.height * 0.075,
                          ),
                        ),
                        child: const AutoSizeText(
                          'Sign Up',
                          minFontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            context.router.replaceNamed('/sign_in_screen');
                          },
                          child: const AutoSizeText(
                            'Log in here',
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
