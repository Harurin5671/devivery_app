import 'package:flutter/material.dart';

import 'package:delivery/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  static const String routePath = '/home';
  static const String routeName = 'home_page';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            HomeHeader(),
            const SizedBox(height: 24),
            HomeSearch(),
            const SizedBox(height: 32),
            HomeCategory(),
          ],
        ),
      ),
    );
  }
}
