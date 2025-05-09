import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';
import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';
import 'package:delivery/infrastructure/infrastructure.dart';

class SplashPage extends StatelessWidget {
  static const String routePath = '/splash';
  static const String routeName = 'splash_page';

  const SplashPage({super.key});

  void _redirect(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final isOnboardingComplete = await SharedPreferenceService().readBool(Keys.onBoardingCompleteKey) ?? false;
      if(isOnboardingComplete) {
        return AppNavigation().replaceNamed(LoginPage.routeName);
      }
      AppNavigation().replaceNamed(OnboardingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ejecutamos solo una vez luego de build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _redirect(context);
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashBackground),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Image.asset(AppImages.logoApp, height: 59),
          ),
        ],
      ),
    );
  }
}
