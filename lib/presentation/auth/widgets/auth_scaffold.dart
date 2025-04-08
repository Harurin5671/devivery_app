import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';
import 'package:delivery/common/common.dart';

class AuthScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final bool showBackButton;
  final VoidCallback? onBackTap;

  const AuthScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.showBackButton = false,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121223),
        body: SafeArea(
          child: Stack(
            children: [
              // Fondo con imagen y header
              Container(
                alignment: Alignment.center,
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.loginBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    if (showBackButton)
                      Positioned(
                        top: 16,
                        left: 16,
                        child: GestureDetector(
                          onTap: onBackTap ?? () => AppNavigation().pop(),
                          child:  Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Color(0xFF5E616F),
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              // Parte inferior con el formulario
              Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
