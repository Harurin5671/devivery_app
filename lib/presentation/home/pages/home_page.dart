import 'package:flutter/material.dart';

import 'package:delivery/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  static const String routePath = '/home';
  static const String routeName = 'home_page';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(backgroundColor: Colors.white, elevation: 0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [HomeHeader(), Text('hola')]),
      ),
    );
  }
}
