import 'package:go_router/go_router.dart';

import 'package:delivery/presentation/presentation.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: SplashPage.routePath,
  routes: [
    GoRoute(
      path: SplashPage.routePath,
      name: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: OnboardingPage.routePath,
      name: OnboardingPage.routeName,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routePath,
      name: SignupPage.routeName,
      builder: (context, state) => const SignupPage(),
    ),
  ],
);
