import 'package:flutter/material.dart';

import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';

class VerificationPage extends StatelessWidget {
  static const String routePath = '/verification';
  static const String routeName = 'verification_page';

  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Verification',
      showBackButton: true,
      subtitle: 'We have sent a code to your email\nexample@gmail.com',
      child: Form(
        child: Column(
          children: [
            AuthOtpInput(),
            const SizedBox(height: 30),
            // AuthFormButton(text: 'Verify', onPressed: () {}),
            AppButton(text: 'Verify', onPressed: (){
              // AppNavigation().pushNamed(LocationPermissionPage.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
