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
import 'package:flutter/material.dart' as _i6;

import '../../ui/features/authentication/login_page.dart' as _i2;
import '../../ui/features/authentication/signup_page.dart' as _i3;
import '../../ui/features/home/home_page.dart' as _i4;
import '../../ui/features/onboarding/onboarding_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.LoginScreen(key: args.key),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignupScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          OnboardingRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/login-screen',
        ),
        _i5.RouteConfig(
          SignupRoute.name,
          path: '/signup-screen',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-screen',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i6.Key? key})
      : super(
          LoginRoute.name,
          path: '/login-screen',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({_i6.Key? key})
      : super(
          SignupRoute.name,
          path: '/signup-screen',
          args: SignupRouteArgs(key: key),
        );

  static const String name = 'SignupRoute';
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeRoute';
}
