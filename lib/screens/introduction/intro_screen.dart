import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/loading/loading_screen.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/widgets/intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _introKey = GlobalKey<IntroductionScreenState>();
    final _introProvider = Provider.of<IntroProvider>(context);
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return const LoadingScreen();
        } else {
          if (_introProvider.isFresher ?? false) {
            return IntroWidget(
              introKey: _introKey,
              introProvider: _introProvider,
            );
          } else {
            final UserModel? user = snapshot.data;
            return user == null ? const SignInScreen() : const HomeScreen();
          }
        }
      },
    );
  }
}
// FutureBuilder(
//       future: Future.delayed(const Duration(seconds: 3)),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting ||
//             snapshot.connectionState == ConnectionState.none) {
//           return const LoadingScreen();
//         } else {
//           if (_introProvider.isFresher ?? true) {
//             return IntroWidget(
//               introKey: _introKey,
//               introProvider: _introProvider,
//             );
//           } else {
//             //TODO: Later change this to SignInScreen()
//             return const SignInScreen();
//           }
//         }
//       },
//     );