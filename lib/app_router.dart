// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';

import '../scaffolds/scaffold_home.dart';

//routes for the app

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: ScaffoldHome, initial: true), //guards: [CheckIfLoginIsDone],
  ],
)
class $AppRouter {}

//guard for login check

/*class CheckIfLoginIsDone extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    
  }
}*/
