// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'package:flutter/material.dart';
import 'package:fossil_mobile/app/widget/app_start_page.dart';
import 'package:fossil_mobile/features/auth/widget/login.dart';
import 'package:fossil_mobile/features/auth/widget/register.dart';
import 'package:fossil_mobile/features/hoses/widget/hose.dart';
import 'package:fossil_mobile/features/hoses/widget/set_odometer.dart';
import 'package:fossil_mobile/features/hoses/widget/set_vehicle.dart';
import 'package:fossil_mobile/features/reports/widget/report.dart';
import 'package:fossil_mobile/features/settings/widget/setting.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: AppRoute.path,
    routes: $appRoutes,
  );
}

@TypedGoRoute<AppRoute>(path: AppRoute.path)
class AppRoute extends GoRouteData {
  const AppRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppStartPage();
  }
}

@TypedGoRoute<SignInRoute>(path: SignInRoute.path)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  static const path = '/auth/signin';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Login();
  }
}

@TypedGoRoute<SignUpRoute>(path: SignUpRoute.path)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  static const path = '/auth/signup';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Register();
  }
}

@TypedGoRoute<HosePageRoute>(path: HosePageRoute.path)
class HosePageRoute extends GoRouteData {
  const HosePageRoute();

  static const path = '/hose';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HosePage();
  }
}

@TypedGoRoute<SetVehiclePageRoute>(path: SetVehiclePageRoute.path)
class SetVehiclePageRoute extends GoRouteData {
  const SetVehiclePageRoute();

  static const path = '/hose/set-vehicle';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SetVehiclePage();
  }
}

@TypedGoRoute<SetOdometerPageRoute>(path: SetOdometerPageRoute.path)
class SetOdometerPageRoute extends GoRouteData {
  const SetOdometerPageRoute();

  static const path = '/hose/set-odometer';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SetOdometerPage();
  }
}

@TypedGoRoute<ProfilePageRoute>(path: ProfilePageRoute.path)
class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  static const path = '/profile';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Profile();
  }
}

@TypedGoRoute<ReportPageRoute>(path: ReportPageRoute.path)
class ReportPageRoute extends GoRouteData {
  const ReportPageRoute();

  static const path = '/report';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Report();
  }
}

class GoNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did push route $route : $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did pop route $route : $previousRoute');
  }
}
