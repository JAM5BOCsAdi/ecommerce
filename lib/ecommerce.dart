import 'package:ecommerce/auto_route/auto_route.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/screens/introduction/intro_screen.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    initScreenUtils(context);

    final appRouter = AppRouter();
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => ConnectivityProvider(),
        //   child: const Ecommerce(),
        // ),
        ChangeNotifierProvider(
          create: (_) => IntroProvider(),
          child: const IntroScreen(),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
