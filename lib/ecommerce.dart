import 'package:ecommerce/auto_route/auto_route.dart';
import 'package:ecommerce/providers/intro_provider.dart';
import 'package:ecommerce/providers/scroll_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ecommerce extends StatelessWidget {
  Ecommerce({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    initScreenUtils(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IntroProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScrollProvider(),
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
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
