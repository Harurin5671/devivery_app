import 'package:flutter/material.dart';

import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';

class LoginPage extends StatelessWidget {
  static const String routePath = '/login';
  static const String routeName = 'login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Log In',
      subtitle: 'Please sign in to your existing account',
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LabeledInputField(
                label: 'email',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              LabeledInputField(label: 'password', obscureText: true),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        // color: Color(0xFF98A8B8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE3EBF2),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF7E8A97),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigation().pushNamed(ForgotPasswordPage.routeName);
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 14, color: Color(0xFFFF7622)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // AuthFormButton(text: 'Log In', onPressed: () {
              //   AppNavigation().pushNamed(LocationPermissionPage.routeName);
              // }),
              AppButton(text: 'log in', onPressed: (){
                AppNavigation().pushNamed(LocationPermissionPage.routeName);
              }),
              const SizedBox(height: 30),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16, color: Color(0xFF646982)),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap:
                        () => AppNavigation().pushNamed(SignupPage.routeName),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Color(0xFFFF7622),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
