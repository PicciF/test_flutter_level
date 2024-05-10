// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i8;
import 'package:flutter/material.dart' as _i6;
import 'package:test_flutter_level/app_router.dart' as _i7;
import 'package:test_flutter_level/models/specie.dart' as _i9;
import 'package:test_flutter_level/scaffolds/scaffold_home.dart' as _i4;
import 'package:test_flutter_level/scaffolds/scaffold_login.dart' as _i3;
import 'package:test_flutter_level/scaffolds/scaffold_single_specie.dart'
    as _i2;
import 'package:test_flutter_level/scaffolds/scaffold_splash.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.checkIfSplashIsDone,
    required this.checkIfLoginIsDone,
  }) : super(navigatorKey);

  final _i7.CheckIfSplashIsDone checkIfSplashIsDone;

  final _i7.CheckIfLoginIsDone checkIfLoginIsDone;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ScaffoldSplashRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ScaffoldSplash(),
      );
    },
    ScaffoldSingleSpecieRoute.name: (routeData) {
      final args = routeData.argsAs<ScaffoldSingleSpecieRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.ScaffoldSingleSpecie(
          key: args.key,
          specie: args.specie,
        ),
      );
    },
    ScaffoldLoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ScaffoldLogin(),
      );
    },
    ScaffoldHomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ScaffoldHome(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          ScaffoldSplashRoute.name,
          path: '/scaffold-splash',
        ),
        _i5.RouteConfig(
          ScaffoldSingleSpecieRoute.name,
          path: '/scaffold-single-specie',
          guards: [
            checkIfSplashIsDone,
            checkIfLoginIsDone,
          ],
        ),
        _i5.RouteConfig(
          ScaffoldLoginRoute.name,
          path: '/scaffold-login',
          guards: [checkIfSplashIsDone],
        ),
        _i5.RouteConfig(
          ScaffoldHomeRoute.name,
          path: '/',
          guards: [
            checkIfSplashIsDone,
            checkIfLoginIsDone,
          ],
        ),
      ];
}

/// generated route for
/// [_i1.ScaffoldSplash]
class ScaffoldSplashRoute extends _i5.PageRouteInfo<void> {
  const ScaffoldSplashRoute()
      : super(
          ScaffoldSplashRoute.name,
          path: '/scaffold-splash',
        );

  static const String name = 'ScaffoldSplashRoute';
}

/// generated route for
/// [_i2.ScaffoldSingleSpecie]
class ScaffoldSingleSpecieRoute
    extends _i5.PageRouteInfo<ScaffoldSingleSpecieRouteArgs> {
  ScaffoldSingleSpecieRoute({
    _i8.Key? key,
    required _i9.Specie specie,
  }) : super(
          ScaffoldSingleSpecieRoute.name,
          path: '/scaffold-single-specie',
          args: ScaffoldSingleSpecieRouteArgs(
            key: key,
            specie: specie,
          ),
        );

  static const String name = 'ScaffoldSingleSpecieRoute';
}

class ScaffoldSingleSpecieRouteArgs {
  const ScaffoldSingleSpecieRouteArgs({
    this.key,
    required this.specie,
  });

  final _i8.Key? key;

  final _i9.Specie specie;

  @override
  String toString() {
    return 'ScaffoldSingleSpecieRouteArgs{key: $key, specie: $specie}';
  }
}

/// generated route for
/// [_i3.ScaffoldLogin]
class ScaffoldLoginRoute extends _i5.PageRouteInfo<void> {
  const ScaffoldLoginRoute()
      : super(
          ScaffoldLoginRoute.name,
          path: '/scaffold-login',
        );

  static const String name = 'ScaffoldLoginRoute';
}

/// generated route for
/// [_i4.ScaffoldHome]
class ScaffoldHomeRoute extends _i5.PageRouteInfo<void> {
  const ScaffoldHomeRoute()
      : super(
          ScaffoldHomeRoute.name,
          path: '/',
        );

  static const String name = 'ScaffoldHomeRoute';
}
