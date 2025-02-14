import 'package:auto_route/auto_route.dart';
import 'package:presence_app/initial.dart';
import 'package:presence_app/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: InitialRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/home',
          page: HomeView.page,
        ),
      ];
}
