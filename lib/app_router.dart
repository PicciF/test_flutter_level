// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:test_flutter_level/app_router.gr.dart';
import 'package:test_flutter_level/globals.dart';
import 'package:test_flutter_level/scaffolds/scaffold_single_specie.dart';
import 'package:test_flutter_level/scaffolds/scaffold_splash.dart';

import '../scaffolds/scaffold_home.dart';

//routes for the app

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: ScaffoldSplash),
    AutoRoute(page: ScaffoldSingleSpecie),
    AutoRoute(page: ScaffoldHome, guards: [CheckIfSplashIsDone], initial: true), //guards: [CheckIfLoginIsDone],
  ],
)
class $AppRouter {}

//guard for login check

class CheckIfSplashIsDone extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (global.splashAlreadyDone) {
      resolver.next(true);
    } else {
      router.replace(const ScaffoldSplashRoute());
    }
  }
}
