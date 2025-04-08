import 'package:go_router/go_router.dart';

import 'package:delivery/presentation/presentation.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: LoginPage.routePath,
    name: LoginPage.routeName,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: ForgotPasswordPage.routePath,
    name: ForgotPasswordPage.routeName,
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  GoRoute(
    path: SignupPage.routePath,
    name: SignupPage.routeName,
    builder: (context, state) => const SignupPage(),
  ),
  GoRoute(
    path: VerificationPage.routePath,
    name: VerificationPage.routeName,
    builder: (context, state) => const VerificationPage(),
  ),
];