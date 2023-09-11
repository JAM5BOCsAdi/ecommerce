import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/auto_route/auto_route.dart';
import 'package:ecommerce/providers/connectivity_provider.dart';
import 'package:ecommerce/providers/introduction_provider.dart';
import 'package:ecommerce/screens/connectivity/connectivity_screen.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key});

  @override
  Widget build(BuildContext context) {
    initScreenUtils(context);

    final appRouter = AppRouter();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (_) => IntroductionProvider()),
      ],
      child: Consumer<ConnectivityProvider>(
        builder: (context, connectivityProvider, child) {
          if (connectivityProvider.connectivityResult ==
              ConnectivityResult.none) {
            // No internet connection, navigate to ConnectivityScreen
            return const ConnectivityScreen();
          } else {
            // There is an internet connection, navigate to the main app
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'E-Commerce',
              theme: FlexThemeData.light(
                useMaterial3: true,
                scheme: FlexScheme.purpleM3,
              ),
              darkTheme: FlexThemeData.dark(
                useMaterial3: true,
                scheme: FlexScheme.purpleM3,
              ),
              themeMode: ThemeMode.system,
              routerConfig: appRouter.config(),
            );
          }
        },
      ),
    );
  }
}
