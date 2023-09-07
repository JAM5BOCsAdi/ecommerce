import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/introduction_screen',
          page: IntroRoute.page,
        ),
        AutoRoute(
          path: '/login_screen',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/registration_screen',
          page: RegistrationRoute.page,
        ),
      ];
}
