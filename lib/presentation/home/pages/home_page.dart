import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routePath = '/home';
  static const String routeName = 'home_page';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
    );
  }
}