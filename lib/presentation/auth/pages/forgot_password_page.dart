import 'package:flutter/material.dart';

import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String routePath = '/forgot-password';
  static const String routeName = 'forgot_password_page';

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Forgot Password',
      showBackButton: true,
      subtitle: 'Please sign in to your existing account',
      child: Form(
        child: Column(
          children: [
            LabeledInputField(label: 'email', type: TextInputType.emailAddress),
            const SizedBox(height: 24),
            // AuthFormButton(text: 'send code', onPressed: () {
            //   AppNavigation().pushNamed(VerificationPage.routeName);
            // }),
             AppButton(text: 'Send Code', onPressed: (){
                AppNavigation().pushNamed(LocationPermissionPage.routeName);
              }),
          ],
        ),
      ),
    );
  }
}
