import 'package:auto_route/annotations.dart';
import 'package:ephiway/ui/features/authentication/signup_page.dart';

import '../../ui/features/authentication/login_page.dart';
import '../../ui/features/home/home_page.dart';
import '../../ui/features/onboarding/onboarding_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: SignupScreen),
    AutoRoute(page: HomeScreen),


  ],
)
class $AppRouter {}