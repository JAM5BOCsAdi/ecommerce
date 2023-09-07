import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/first',
          page: FirstRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/second',
          page: SecondRoute.page,
        ),
        AutoRoute(
          path: '/third',
          page: ThirdRoute.page,
        ),
      ];
}
