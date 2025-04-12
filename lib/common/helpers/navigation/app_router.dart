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
    ...authRoutes,
    GoRoute(
      path: LocationPermissionPage.routePath,
      name: LocationPermissionPage.routeName,
      builder: (context, state) => const LocationPermissionPage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
