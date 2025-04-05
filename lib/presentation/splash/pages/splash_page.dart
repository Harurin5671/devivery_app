import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';
import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';

class SplashPage extends StatelessWidget {
  static const String routePath = '/splash';
  static const String routeName = 'splash_page';
  
  const SplashPage({super.key});
  
  @override
  Widget build(BuildContext context) {
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
            child: GestureDetector(
              onTap: () {
                AppNavigation(router: appRouter).replaceNamed(OnboardingPage.routeName);
              },
              child: Image.asset(AppImages.logoApp, height: 59,)),
          ),
        ],
      ),
    );
  }
}