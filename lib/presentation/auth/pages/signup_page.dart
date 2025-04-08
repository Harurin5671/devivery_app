import 'package:flutter/material.dart';

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
      onBackTap: () => AppNavigation().pop(),
      subtitle: 'Please sign up to get started',
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LabeledInputField(label: 'name'),
              const SizedBox(height: 24),
              LabeledInputField(
                label: 'email',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              LabeledInputField(label: 'password', obscureText: true),
              const SizedBox(height: 24),
              LabeledInputField(label: 're-type password', obscureText: true),
              const SizedBox(height: 30,),
              AuthFormButton(text: 'Sign up', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
