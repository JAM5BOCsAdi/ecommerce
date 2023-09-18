import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/wrapper_screen',
          page: Wrapper.page,
        ),
        AutoRoute(
          path: '/intro_screen',
          page: IntroRoute.page,
        ),
        AutoRoute(
          path: '/sign_in_screen',
          page: SignInRoute.page,
        ),
        AutoRoute(
          path: '/sign_up_screen',
          page: SignUpRoute.page,
        ),
      ];
}
