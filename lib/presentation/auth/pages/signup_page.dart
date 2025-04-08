import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';
import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';

class SignupPage extends StatelessWidget {
  static const String routePath = '/signup';
  static const String routeName = 'signup_page';

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Sign Up',
      showBackButton: true,
      onBackTap: () => AppNavigation(router: appRouter).pop(),
      subtitle: 'Please sign up to get started',
      child: const Placeholder(),
    );
  }
}