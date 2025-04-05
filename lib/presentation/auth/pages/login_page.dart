import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';

class LoginPage extends StatelessWidget {
  static const String routePath = '/login';
  static const String routeName = 'login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121223),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 240,
              // padding: EdgeInsets.only(top: 118, left: 138, right: 138),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.loginBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Log In', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('Please sign in to your existing account', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
