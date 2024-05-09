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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_flutter_level/app_router.dart' as _i5;
import 'package:test_flutter_level/scaffolds/scaffold_home.dart' as _i2;
import 'package:test_flutter_level/scaffolds/scaffold_splash.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter({
    _i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
    required this.checkIfSplashIsDone,
  }) : super(navigatorKey);

  final _i5.CheckIfSplashIsDone checkIfSplashIsDone;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ScaffoldSplashRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ScaffoldSplash(),
      );
    },
    ScaffoldHomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ScaffoldHome(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          ScaffoldSplashRoute.name,
          path: '/scaffold-splash',
        ),
        _i3.RouteConfig(
          ScaffoldHomeRoute.name,
          path: '/',
          guards: [checkIfSplashIsDone],
        ),
      ];
}

/// generated route for
/// [_i1.ScaffoldSplash]
class ScaffoldSplashRoute extends _i3.PageRouteInfo<void> {
  const ScaffoldSplashRoute()
      : super(
          ScaffoldSplashRoute.name,
          path: '/scaffold-splash',
        );

  static const String name = 'ScaffoldSplashRoute';
}

/// generated route for
/// [_i2.ScaffoldHome]
class ScaffoldHomeRoute extends _i3.PageRouteInfo<void> {
  const ScaffoldHomeRoute()
      : super(
          ScaffoldHomeRoute.name,
          path: '/',
        );

  static const String name = 'ScaffoldHomeRoute';
}
