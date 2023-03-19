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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../ui/features/authentication/login_page.dart' as _i2;
import '../../ui/features/authentication/signup_page.dart' as _i3;
import '../../ui/features/onboarding/onboarding_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.OnboardingScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignupScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          OnboardingRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/login-screen',
        ),
        _i4.RouteConfig(
          SignupRoute.name,
          path: '/signup-screen',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i4.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({_i5.Key? key})
      : super(
          OnboardingRoute.name,
          path: '/',
          args: OnboardingRouteArgs(key: key),
        );

  static const String name = 'OnboardingRoute';
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignupScreen]
class SignupRoute extends _i4.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup-screen',
        );

  static const String name = 'SignupRoute';
}
