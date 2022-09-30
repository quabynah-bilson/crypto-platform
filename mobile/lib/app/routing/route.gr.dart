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
import 'package:mobile/features/dashboard/presentation/pages/dashboard.dart'
    as _i2;
import 'package:mobile/features/shared/presentation/pages/welcome.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i3.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i3.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}
