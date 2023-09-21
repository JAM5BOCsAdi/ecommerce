import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/introduction/intro_screen.dart';
import 'package:ecommerce/screens/loading/loading_screen.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _introProvider = Provider.of<IntroProvider>(context);
    final _authService = Provider.of<AuthService>(context);

    return StreamBuilder(
      stream: _authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return LoadingScreen.instance().loadingScreen(context);
        } else {
          if (_introProvider.isFresher ?? false) {
            return const IntroScreen();
          } else {
            final UserModel? user = snapshot.data;
            return user == null ? const SignInScreen() : const HomeScreen();
          }
        }
      },
    );
  }
}
