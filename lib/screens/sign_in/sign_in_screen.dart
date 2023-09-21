import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/screens/loading/loading_indicator.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _authService = context.read<AuthService>();
    final _loading = LoadingIndicatorDialog.instance();
    // final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Scrollbar(
            child: Padding(
              padding: EdgeInsets.only(
                top: _screen.height * 0.025,
                left: _screen.width * 0.075,
                right: _screen.width * 0.075,
              ),
              child: Container(
                color: Theme.of(context).colorScheme.onPrimary,
                width: _screen.width,
                height: _screen.height,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _screen.height * 0.025),
                      child: Column(
                        children: [
                          // SvgPicture.asset(
                          //   'assets/images/sign_in.svg',
                          //  height: _screen.height * 0.5,
                          // width: _screen.width * 0.5,
                          //),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: _screen.height * 0.025,
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                label: AutoSizeText('Email'),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: _screen.height * 0.025,
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                label: AutoSizeText('Password'),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              obscuringCharacter: '*',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _authService.signInWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);

                              _loading.show(context);
                              await context.router.replaceNamed('/home_screen');
                              _loading.dismiss();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                _screen.width,
                                _screen.height * 0.075,
                              ),
                            ),
                            child: const AutoSizeText(
                              'Sign In',
                              minFontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AutoSizeText('Don\'t have an account?'),
                              TextButton(
                                onPressed: () async {
                                  _loading.show(context);

                                  await context.router
                                      .replaceNamed('/sign_up_screen');
                                  _loading.dismiss();
                                },
                                child: const AutoSizeText(
                                  'Sign up here',
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
          ),
        ),
      ),
    );
  }
}
