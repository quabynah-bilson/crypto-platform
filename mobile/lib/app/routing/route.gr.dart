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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:mobile/features/shared/presentation/pages/welcome.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WelcomePageRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          WelcomePageRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomePageRoute extends _i2.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/',
        );

  static const String name = 'WelcomePageRoute';
}
