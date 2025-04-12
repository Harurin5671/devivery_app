import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MultiBlocListener(
        listeners: [
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              log('----------------------- State: $state');
              // if (state is LocationPermissionDenied) {
              //   return AppNavigation().pushNamed(
              //     LocationPermissionPage.routeName,
              //   );
              // }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              log('----------------------- State Auth: $state');
              if (state is AuthFailure) {
                return AlertHelper.showSnackBar(
                  context,
                  message: state.message,
                  type: AlertType.error,
                );
              }
              if (state is AuthPermissionRequired) {
                return AppNavigation().pushNamed(
                  LocationPermissionPage.routeName,
                );
              }
              if (state is AuthAuthenticated) {
                return AppNavigation().pushNamed(HomePage.routeName);
              }
            },
          ),
        ],
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: BlocBuilder<LoginFormBloc, LoginFormState>(
        builder: (context, state) {
          final loginFormBloc = context.read<LoginFormBloc>();
          return Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LabeledInputField(
                    label: 'email',
                    hintText: 'example@gmail.com',
                    type: TextInputType.emailAddress,
                    onChanged:
                        (value) => loginFormBloc.add(
                          LoginEmailChangedEvent(email: value),
                        ),
                  ),
                  const SizedBox(height: 24),
                  LabeledInputField(
                    label: 'password',
                    hintText: '* * * * * * * *',
                    obscureText: !state.showPassword,
                    onChanged:
                        (value) => loginFormBloc.add(
                          LoginPasswordChangedEvent(password: value),
                        ),
                    suffixIcon: IconButton(
                      onPressed:
                          () => loginFormBloc.add(
                            LoginTogglePasswordVisibilityEvent(),
                          ),
                      icon: Icon(
                        state.showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xFFB4B9CA),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              loginFormBloc.add(LoginToggleRememberMeEvent());
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFE3EBF2),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:
                                  state.rememberMe
                                      ? Container(
                                        alignment: Alignment.center,
                                        color: Color(0xFFE3EBF2),
                                        child: const Icon(
                                          Icons.check,
                                          color: Color(0xFF181C2E),
                                          size: 15,
                                        ),
                                      )
                                      : const SizedBox.shrink(),
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
                          AppNavigation().pushNamed(
                            ForgotPasswordPage.routeName,
                          );
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFF7622),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: 'log in',
                    onPressed: () async {
                      final authBloc = context.read<AuthBloc>();
                      authBloc.add(
                        AuthLoginEvent(
                          email: loginFormBloc.state.email,
                          password: loginFormBloc.state.password,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF646982),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap:
                            () =>
                                AppNavigation().pushNamed(SignupPage.routeName),
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
          );
        },
      ),
    );
  }
}
